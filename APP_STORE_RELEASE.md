# Publishing Inoface to the App Store (iOS)

Project specifics this guide is based on:

| Item | Value |
|---|---|
| App / display name | Inoface |
| Bundle ID | `com.inoser.inofaceios` |
| Apple Dev Team ID | `PL35WBFPFC` |
| iOS deployment target | 15.6 |
| Version scheme | `pubspec.yaml` → `version: <marketing>+<build>` (e.g. `2.0.2+105` = CFBundleShortVersionString `2.0.2`, CFBundleVersion `105`) |
| Push | `aps-environment = production` already set in `ios/Runner/Runner.entitlements` |
| Encryption declaration | `ITSAppUsesNonExemptEncryption = false` already set in `ios/Runner/Info.plist` |
| Tested toolchain | Flutter 3.47.5 stable, Xcode 26.3, CocoaPods |

## 0. Prerequisites

- [ ] Xcode installed, Apple ID signed in (Xcode → Settings → Accounts).
- [ ] Distribution certificate + App Store provisioning profile for `com.inoser.inofaceios` exist (Xcode can auto-manage this on Archive).
- [ ] Working tree clean (`git status`), current branch up to date.
- [ ] If the new **marketing version** differs from the live one, create that version first in App Store Connect (My Apps → Inoface → App Store → `+ Version`). The binary's marketing version must match the Connect version.

## 1. Bump the version

App Store Connect rejects reused build numbers — every upload needs a new one.

```yaml
# pubspec.yaml
version: 2.0.2+105   # marketing version + build number (bump +N each upload)
```

Same-version fix → bump build only (`2.0.2+104` → `2.0.2+105`).
New release → bump both, and create the matching version in App Store Connect first.

Commit it:

```bash
git add pubspec.yaml
git commit -m "Release iOS 2.0.2+105"
```

## 2. Clean build (Flutter CLI path — recommended)

```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter build ipa --release
```

What this does: regenerates iOS build files, installs Pods (platform iOS 15.6),
archives with automatic signing (team `PL35WBFPFC` from the Xcode project),
and exports an App Store IPA.

Outputs:

- Archive: `build/ios/archive/Runner.xcarchive`
- IPA: `build/ios/ipa/*.ipa` (e.g. `inoface_lescopains.ipa`)

Expected validation output:

```text
[✓] App Settings Validation
    • Version Number: 2.0.2
    • Build Number: 105
    • Display Name: Inoface
    • Deployment Target: 15.6
    • Bundle Identifier: com.inoser.inofaceios
✓ Built IPA to build/ios/ipa
```

> The CocoaPods warning about "base configuration ... custom config" during
> `pod install` is normal for Flutter projects — safe to ignore.

## 3. Alternative: Archive from Xcode (manual signing)

Use this if `flutter build ipa` fails on signing, or you prefer manual control:

```bash
open ios/Runner.xcworkspace   # always the .xcworkspace (Pods), never .xcodeproj
```

In Xcode:

1. Select the **Runner** scheme, target **Any iOS Device (arm64)**.
2. Signing & Capabilities → Team → your team; enable *Automatically manage signing*.
3. Product → **Archive**.
4. When Organizer opens → **Distribute App** → **App Store Connect** → Upload.
   (Uses the Apple ID signed in under Xcode → Settings → Accounts.)

## 4. Upload the IPA

Pick one (skip if you already distributed from Xcode in step 3):

**Option A — Transporter (simplest):**
Install Apple's free *Transporter* app from the Mac App Store, sign in,
drag & drop `build/ios/ipa/*.ipa`.

**Option B — altool (CLI, needs an App Store Connect API key):**

```bash
xcrun altool --upload-app --type ios \
  -f build/ios/ipa/inoface_lescopains.ipa \
  --apiKey YOUR_API_KEY --apiIssuer YOUR_ISSUER_ID
```

## 5. App Store Connect

1. Go to My Apps → **Inoface** (verify bundle ID `com.inoser.inofaceios`,
   and the correct team in the top-right switcher).
2. **TestFlight** tab → iOS builds → find `2.0.2 (105)`.
   Status is *Processing* for ~10–60 min before it becomes selectable.
3. **App Store** tab → iOS App → version **2.0.2** → scroll to **Build** → `+`
   → select build 105 → Save.
4. Submit for Review.

No export-compliance questionnaire: encryption use is pre-declared `false`.

## 5.1 TestFlight vs Distribution — what moves where (spoiler: nothing, automatically)

- **TestFlight and the App Store are separate tracks.** A build never moves
  by itself — you must attach it to a store version and submit it for review.
- **TestFlight builds are valid 90 days** from upload, then expire
  automatically. Uploading a newer build supersedes the old one but doesn't
  delete it. A TestFlight build stays usable while the store review is pending.
- **"Prêt à soumettre" / "Ready to Submit" on the TestFlight tab** only
  concerns *external* beta testing (submitting the build for Beta review so
  outside testers can try it). It is optional and unrelated to the store
  release — safe to ignore if you only want to publish.
- **If the version row is missing under the App Store tab**, the version was
  never created in Connect (uploads can't create it — you must):
  1. App Store tab → left sidebar, under **iOS App**, click **+** next to
     *Version iOS* (add version).
  2. Enter the marketing version matching the binary (e.g. **2.0.2**).
  3. On the new version page → **Build** → `+` → select the build → Save →
     Submit for Review.
- **If the version is already live (Ready for Sale / Prêt à être vendu)**,
  nothing can be attached to it. Create the next version (e.g. **2.0.3**) in
  Connect **and** rebuild with the matching marketing version
  (`pubspec.yaml` → `2.0.3+<next build>`), because binary and Connect
  versions must match.

Status flow after submitting: *Waiting for Review* → *In Review* →
*Ready for Sale* (live). Release is automatic or manual depending on the
version's release setting.

## 6. Troubleshooting

| Symptom | Cause / fix |
|---|---|
| Build 105 never appears in TestFlight | Wait up to 1h (processing). Past that: check the Apple ID holder's email incl. spam for an **ITMS-** rejection; look for a red error on the TestFlight row. |
| Build stuck on "Prêt à soumettre" (TestFlight) | Normal — that's the *external beta* submission state, optional. For the store release, switch to the App Store tab (see 5.1). |
| No version row under the App Store tab | Versions aren't auto-created. Add it manually (App Store → iOS App → `+`), see 5.1. |
| Can't find any "new version" | Correct — same marketing version = no new row. The build attaches to the existing 2.0.2 under App Store → 2.0.2 → Build. |
| Nothing visible at all | Wrong team selected (top-right switcher) or wrong app record — must be the app with bundle ID `com.inoser.inofaceios`. |
| Live version is already 2.0.2 (Ready for Sale) | You can't attach to it. Create version **2.0.3** in Connect, bump `pubspec.yaml` to `2.0.3+<next build>`, rebuild, re-upload. |
| `ENABLE_USER_SCRIPT_SANDBOXING` merge conflict in `project.pbxproj` | Keep `= NO` in all 6 build configurations (project requirement for compatibility); never duplicate the key in one dict. |
| `ios/Flutter/ephemeral/*` or `ios/build/*` show as modified | They are machine-generated and now git-ignored. If still tracked: `git rm -r --cached ios/build ios/Flutter/ephemeral` (keeps files on disk). |
| `flutter build ipa` signing failure | Fall back to the Xcode Archive path (step 3) with automatic signing, which surfaces fixable signing issues in the GUI. |
