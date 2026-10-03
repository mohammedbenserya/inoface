#!/usr/bin/env bash
#
# publish_ios.sh — pull, bump version, build and prep an Inoface App Store release.
#
# Usage: run from the repo root:
#   ./publish_ios.sh
#
# What it does:
#   1. Pulls latest changes (fetch + rebase) and refuses to continue on a dirty tree.
#   2. Asks whether/how to bump the version in pubspec.yaml.
#   3. Runs flutter clean / pub get / pod install / flutter build ipa --release.
#   4. Opens the archive in Xcode Organizer for MANUAL distribution
#      (no API upload — you click Distribute App yourself).
#
set -euo pipefail

PUBSPEC="pubspec.yaml"
BUNDLE_ID="com.inoser.inofaceios"

die()  { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*"; }

# --- 0. sanity checks ---------------------------------------------------------
command -v git >/dev/null     || die "git not found in PATH"
command -v flutter >/dev/null || die "flutter not found in PATH"
command -v pod >/dev/null     || die "cocoapods not found (run: sudo gem install cocoapods)"
[ -f "$PUBSPEC" ]              || die "run this script from the repo root ($PUBSPEC not found)"

# --- 1. pull latest changes first ---------------------------------------------
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
info "Current branch: $BRANCH — pulling latest..."
git fetch origin
git pull --rebase origin "$BRANCH"

if [ -n "$(git status --porcelain)" ]; then
  echo "--- dirty files ---"
  git status --short
  die "working tree is dirty — commit or stash your changes, then re-run"
fi
info "Repo is up to date and clean."

# --- 2. version bump (ask the user) -------------------------------------------
CURRENT="$(grep -E '^version:' "$PUBSPEC" | awk '{print $2}')"
MARKETING="${CURRENT%%+*}"
BUILD="${CURRENT##*+}"
NEXT_BUILD="$((BUILD + 1))"

info "Current version: $CURRENT  (marketing $MARKETING, build $BUILD)"
echo "  1) Build bump (recommended for same-version fix): $MARKETING+$NEXT_BUILD"
echo "  2) Custom version (e.g. 2.0.3+106 — also create it in App Store Connect first)"
echo "  3) No bump, keep $CURRENT"
read -r -p "Choice [1/2/3, default=1]: " CHOICE
CHOICE="${CHOICE:-1}"

NEW="$CURRENT"
case "$CHOICE" in
  1) NEW="$MARKETING+$NEXT_BUILD" ;;
  2)
    read -r -p "Enter new version (format X.Y.Z+N): " NEW
    [[ "$NEW" =~ ^[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+$ ]] \
      || die "bad format '$NEW' — expected e.g. 2.0.3+106"
    ;;
  3) info "Keeping version $CURRENT" ;;
  *) die "invalid choice '$CHOICE'" ;;
esac

if [ "$NEW" != "$CURRENT" ]; then
  # BSD sed (macOS) in-place edit
  sed -i '' "s/^version: .*/version: $NEW/" "$PUBSPEC"
  info "Bumped pubspec.yaml: $CURRENT -> $NEW"
  read -r -p "Commit the bump now? [Y/n]: " COMMIT
  if [ "${COMMIT:-Y}" = "Y" ] || [ "${COMMIT:-Y}" = "y" ]; then
    git add "$PUBSPEC"
    git commit -m "Release iOS $NEW"
  fi
fi

# --- 3. clean build ------------------------------------------------------------
info "flutter clean..."
flutter clean

info "flutter pub get..."
flutter pub get

info "pod install..."
(cd ios && pod install)

info "Building release IPA (takes several minutes)..."
flutter build ipa --release

IPA="$(ls -t build/ios/ipa/*.ipa 2>/dev/null | head -n 1)"
[ -n "${IPA:-}" ] || die "no IPA found under build/ios/ipa"
info "Built $IPA"

# --- 4. Xcode archive handoff — manual distribution, no API -----------------------
XCARCHIVE="build/ios/archive/Runner.xcarchive"
[ -d "$XCARCHIVE" ] || die "archive not found at $XCARCHIVE"
info "Opening the archive in Xcode Organizer..."
open "$XCARCHIVE"

cat <<'NEXT'
Manual distribution in Xcode Organizer:
  1. Select the Runner archive -> Distribute App -> App Store Connect -> Upload.
     (Uses the Apple ID signed into Xcode > Settings > Accounts. No API key needed.)
  2. App Store Connect -> Inoface -> TestFlight (wait for processing, ~10-60 min)
     -> App Store tab -> version -> Build + select build -> Save -> Submit for Review.
NEXT

info "Done. See APP_STORE_RELEASE.md for the full guide + troubleshooting."
