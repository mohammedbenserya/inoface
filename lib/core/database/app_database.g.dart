// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Personne extends DataClass implements Insertable<Personne> {
  final int id_personne;
  final String? nom;
  final String? prenom;
  final String? nom_arabe;
  final String? prenom_arabe;
  final String? identifiant;
  final String? cin;
  final String? gsm;
  final String? email;
  final String? genre;
  final String? token;
  final String? ecolecode;
  Personne(
      {required this.id_personne,
      this.nom,
      this.prenom,
      this.nom_arabe,
      this.prenom_arabe,
      this.identifiant,
      this.cin,
      this.gsm,
      this.email,
      this.genre,
      this.token,
      this.ecolecode});
  factory Personne.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Personne(
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      nom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom']),
      prenom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom']),
      nom_arabe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom_arabe']),
      prenom_arabe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom_arabe']),
      identifiant: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}identifiant']),
      cin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cin']),
      gsm: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gsm']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      genre: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre']),
      token: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}token']),
      ecolecode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ecolecode']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_personne'] = Variable<int>(id_personne);
    if (!nullToAbsent || nom != null) {
      map['nom'] = Variable<String?>(nom);
    }
    if (!nullToAbsent || prenom != null) {
      map['prenom'] = Variable<String?>(prenom);
    }
    if (!nullToAbsent || nom_arabe != null) {
      map['nom_arabe'] = Variable<String?>(nom_arabe);
    }
    if (!nullToAbsent || prenom_arabe != null) {
      map['prenom_arabe'] = Variable<String?>(prenom_arabe);
    }
    if (!nullToAbsent || identifiant != null) {
      map['identifiant'] = Variable<String?>(identifiant);
    }
    if (!nullToAbsent || cin != null) {
      map['cin'] = Variable<String?>(cin);
    }
    if (!nullToAbsent || gsm != null) {
      map['gsm'] = Variable<String?>(gsm);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || genre != null) {
      map['genre'] = Variable<String?>(genre);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String?>(token);
    }
    if (!nullToAbsent || ecolecode != null) {
      map['ecolecode'] = Variable<String?>(ecolecode);
    }
    return map;
  }

  PersonnesCompanion toCompanion(bool nullToAbsent) {
    return PersonnesCompanion(
      id_personne: Value(id_personne),
      nom: nom == null && nullToAbsent ? const Value.absent() : Value(nom),
      prenom:
          prenom == null && nullToAbsent ? const Value.absent() : Value(prenom),
      nom_arabe: nom_arabe == null && nullToAbsent
          ? const Value.absent()
          : Value(nom_arabe),
      prenom_arabe: prenom_arabe == null && nullToAbsent
          ? const Value.absent()
          : Value(prenom_arabe),
      identifiant: identifiant == null && nullToAbsent
          ? const Value.absent()
          : Value(identifiant),
      cin: cin == null && nullToAbsent ? const Value.absent() : Value(cin),
      gsm: gsm == null && nullToAbsent ? const Value.absent() : Value(gsm),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      ecolecode: ecolecode == null && nullToAbsent
          ? const Value.absent()
          : Value(ecolecode),
    );
  }

  factory Personne.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Personne(
      id_personne: serializer.fromJson<int>(json['id_personne']),
      nom: serializer.fromJson<String?>(json['nom']),
      prenom: serializer.fromJson<String?>(json['prenom']),
      nom_arabe: serializer.fromJson<String?>(json['nom_arabe']),
      prenom_arabe: serializer.fromJson<String?>(json['prenom_arabe']),
      identifiant: serializer.fromJson<String?>(json['identifiant']),
      cin: serializer.fromJson<String?>(json['cin']),
      gsm: serializer.fromJson<String?>(json['gsm']),
      email: serializer.fromJson<String?>(json['email']),
      genre: serializer.fromJson<String?>(json['genre']),
      token: serializer.fromJson<String?>(json['token']),
      ecolecode: serializer.fromJson<String?>(json['ecolecode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_personne': serializer.toJson<int>(id_personne),
      'nom': serializer.toJson<String?>(nom),
      'prenom': serializer.toJson<String?>(prenom),
      'nom_arabe': serializer.toJson<String?>(nom_arabe),
      'prenom_arabe': serializer.toJson<String?>(prenom_arabe),
      'identifiant': serializer.toJson<String?>(identifiant),
      'cin': serializer.toJson<String?>(cin),
      'gsm': serializer.toJson<String?>(gsm),
      'email': serializer.toJson<String?>(email),
      'genre': serializer.toJson<String?>(genre),
      'token': serializer.toJson<String?>(token),
      'ecolecode': serializer.toJson<String?>(ecolecode),
    };
  }

  Personne copyWith(
          {int? id_personne,
          String? nom,
          String? prenom,
          String? nom_arabe,
          String? prenom_arabe,
          String? identifiant,
          String? cin,
          String? gsm,
          String? email,
          String? genre,
          String? token,
          String? ecolecode}) =>
      Personne(
        id_personne: id_personne ?? this.id_personne,
        nom: nom ?? this.nom,
        prenom: prenom ?? this.prenom,
        nom_arabe: nom_arabe ?? this.nom_arabe,
        prenom_arabe: prenom_arabe ?? this.prenom_arabe,
        identifiant: identifiant ?? this.identifiant,
        cin: cin ?? this.cin,
        gsm: gsm ?? this.gsm,
        email: email ?? this.email,
        genre: genre ?? this.genre,
        token: token ?? this.token,
        ecolecode: ecolecode ?? this.ecolecode,
      );
  @override
  String toString() {
    return (StringBuffer('Personne(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('nom_arabe: $nom_arabe, ')
          ..write('prenom_arabe: $prenom_arabe, ')
          ..write('identifiant: $identifiant, ')
          ..write('cin: $cin, ')
          ..write('gsm: $gsm, ')
          ..write('email: $email, ')
          ..write('genre: $genre, ')
          ..write('token: $token, ')
          ..write('ecolecode: $ecolecode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_personne, nom, prenom, nom_arabe,
      prenom_arabe, identifiant, cin, gsm, email, genre, token, ecolecode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Personne &&
          other.id_personne == this.id_personne &&
          other.nom == this.nom &&
          other.prenom == this.prenom &&
          other.nom_arabe == this.nom_arabe &&
          other.prenom_arabe == this.prenom_arabe &&
          other.identifiant == this.identifiant &&
          other.cin == this.cin &&
          other.gsm == this.gsm &&
          other.email == this.email &&
          other.genre == this.genre &&
          other.token == this.token &&
          other.ecolecode == this.ecolecode);
}

class PersonnesCompanion extends UpdateCompanion<Personne> {
  final Value<int> id_personne;
  final Value<String?> nom;
  final Value<String?> prenom;
  final Value<String?> nom_arabe;
  final Value<String?> prenom_arabe;
  final Value<String?> identifiant;
  final Value<String?> cin;
  final Value<String?> gsm;
  final Value<String?> email;
  final Value<String?> genre;
  final Value<String?> token;
  final Value<String?> ecolecode;
  const PersonnesCompanion({
    this.id_personne = const Value.absent(),
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.nom_arabe = const Value.absent(),
    this.prenom_arabe = const Value.absent(),
    this.identifiant = const Value.absent(),
    this.cin = const Value.absent(),
    this.gsm = const Value.absent(),
    this.email = const Value.absent(),
    this.genre = const Value.absent(),
    this.token = const Value.absent(),
    this.ecolecode = const Value.absent(),
  });
  PersonnesCompanion.insert({
    this.id_personne = const Value.absent(),
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.nom_arabe = const Value.absent(),
    this.prenom_arabe = const Value.absent(),
    this.identifiant = const Value.absent(),
    this.cin = const Value.absent(),
    this.gsm = const Value.absent(),
    this.email = const Value.absent(),
    this.genre = const Value.absent(),
    this.token = const Value.absent(),
    this.ecolecode = const Value.absent(),
  });
  static Insertable<Personne> custom({
    Expression<int>? id_personne,
    Expression<String?>? nom,
    Expression<String?>? prenom,
    Expression<String?>? nom_arabe,
    Expression<String?>? prenom_arabe,
    Expression<String?>? identifiant,
    Expression<String?>? cin,
    Expression<String?>? gsm,
    Expression<String?>? email,
    Expression<String?>? genre,
    Expression<String?>? token,
    Expression<String?>? ecolecode,
  }) {
    return RawValuesInsertable({
      if (id_personne != null) 'id_personne': id_personne,
      if (nom != null) 'nom': nom,
      if (prenom != null) 'prenom': prenom,
      if (nom_arabe != null) 'nom_arabe': nom_arabe,
      if (prenom_arabe != null) 'prenom_arabe': prenom_arabe,
      if (identifiant != null) 'identifiant': identifiant,
      if (cin != null) 'cin': cin,
      if (gsm != null) 'gsm': gsm,
      if (email != null) 'email': email,
      if (genre != null) 'genre': genre,
      if (token != null) 'token': token,
      if (ecolecode != null) 'ecolecode': ecolecode,
    });
  }

  PersonnesCompanion copyWith(
      {Value<int>? id_personne,
      Value<String?>? nom,
      Value<String?>? prenom,
      Value<String?>? nom_arabe,
      Value<String?>? prenom_arabe,
      Value<String?>? identifiant,
      Value<String?>? cin,
      Value<String?>? gsm,
      Value<String?>? email,
      Value<String?>? genre,
      Value<String?>? token,
      Value<String?>? ecolecode}) {
    return PersonnesCompanion(
      id_personne: id_personne ?? this.id_personne,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      nom_arabe: nom_arabe ?? this.nom_arabe,
      prenom_arabe: prenom_arabe ?? this.prenom_arabe,
      identifiant: identifiant ?? this.identifiant,
      cin: cin ?? this.cin,
      gsm: gsm ?? this.gsm,
      email: email ?? this.email,
      genre: genre ?? this.genre,
      token: token ?? this.token,
      ecolecode: ecolecode ?? this.ecolecode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String?>(nom.value);
    }
    if (prenom.present) {
      map['prenom'] = Variable<String?>(prenom.value);
    }
    if (nom_arabe.present) {
      map['nom_arabe'] = Variable<String?>(nom_arabe.value);
    }
    if (prenom_arabe.present) {
      map['prenom_arabe'] = Variable<String?>(prenom_arabe.value);
    }
    if (identifiant.present) {
      map['identifiant'] = Variable<String?>(identifiant.value);
    }
    if (cin.present) {
      map['cin'] = Variable<String?>(cin.value);
    }
    if (gsm.present) {
      map['gsm'] = Variable<String?>(gsm.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String?>(genre.value);
    }
    if (token.present) {
      map['token'] = Variable<String?>(token.value);
    }
    if (ecolecode.present) {
      map['ecolecode'] = Variable<String?>(ecolecode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonnesCompanion(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('nom_arabe: $nom_arabe, ')
          ..write('prenom_arabe: $prenom_arabe, ')
          ..write('identifiant: $identifiant, ')
          ..write('cin: $cin, ')
          ..write('gsm: $gsm, ')
          ..write('email: $email, ')
          ..write('genre: $genre, ')
          ..write('token: $token, ')
          ..write('ecolecode: $ecolecode')
          ..write(')'))
        .toString();
  }
}

class $PersonnesTable extends Personnes
    with TableInfo<$PersonnesTable, Personne> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonnesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String?> nom = GeneratedColumn<String?>(
      'nom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _prenomMeta = const VerificationMeta('prenom');
  @override
  late final GeneratedColumn<String?> prenom = GeneratedColumn<String?>(
      'prenom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _nom_arabeMeta = const VerificationMeta('nom_arabe');
  @override
  late final GeneratedColumn<String?> nom_arabe = GeneratedColumn<String?>(
      'nom_arabe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _prenom_arabeMeta =
      const VerificationMeta('prenom_arabe');
  @override
  late final GeneratedColumn<String?> prenom_arabe = GeneratedColumn<String?>(
      'prenom_arabe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _identifiantMeta =
      const VerificationMeta('identifiant');
  @override
  late final GeneratedColumn<String?> identifiant = GeneratedColumn<String?>(
      'identifiant', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _cinMeta = const VerificationMeta('cin');
  @override
  late final GeneratedColumn<String?> cin = GeneratedColumn<String?>(
      'cin', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _gsmMeta = const VerificationMeta('gsm');
  @override
  late final GeneratedColumn<String?> gsm = GeneratedColumn<String?>(
      'gsm', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String?> genre = GeneratedColumn<String?>(
      'genre', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String?> token = GeneratedColumn<String?>(
      'token', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ecolecodeMeta = const VerificationMeta('ecolecode');
  @override
  late final GeneratedColumn<String?> ecolecode = GeneratedColumn<String?>(
      'ecolecode', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_personne,
        nom,
        prenom,
        nom_arabe,
        prenom_arabe,
        identifiant,
        cin,
        gsm,
        email,
        genre,
        token,
        ecolecode
      ];
  @override
  String get aliasedName => _alias ?? 'personnes';
  @override
  String get actualTableName => 'personnes';
  @override
  VerificationContext validateIntegrity(Insertable<Personne> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    if (data.containsKey('nom')) {
      context.handle(
          _nomMeta, nom.isAcceptableOrUnknown(data['nom']!, _nomMeta));
    }
    if (data.containsKey('prenom')) {
      context.handle(_prenomMeta,
          prenom.isAcceptableOrUnknown(data['prenom']!, _prenomMeta));
    }
    if (data.containsKey('nom_arabe')) {
      context.handle(_nom_arabeMeta,
          nom_arabe.isAcceptableOrUnknown(data['nom_arabe']!, _nom_arabeMeta));
    }
    if (data.containsKey('prenom_arabe')) {
      context.handle(
          _prenom_arabeMeta,
          prenom_arabe.isAcceptableOrUnknown(
              data['prenom_arabe']!, _prenom_arabeMeta));
    }
    if (data.containsKey('identifiant')) {
      context.handle(
          _identifiantMeta,
          identifiant.isAcceptableOrUnknown(
              data['identifiant']!, _identifiantMeta));
    }
    if (data.containsKey('cin')) {
      context.handle(
          _cinMeta, cin.isAcceptableOrUnknown(data['cin']!, _cinMeta));
    }
    if (data.containsKey('gsm')) {
      context.handle(
          _gsmMeta, gsm.isAcceptableOrUnknown(data['gsm']!, _gsmMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    }
    if (data.containsKey('ecolecode')) {
      context.handle(_ecolecodeMeta,
          ecolecode.isAcceptableOrUnknown(data['ecolecode']!, _ecolecodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_personne};
  @override
  Personne map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Personne.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PersonnesTable createAlias(String alias) {
    return $PersonnesTable(attachedDatabase, alias);
  }
}

class Role extends DataClass implements Insertable<Role> {
  final int id_role;
  final String? role_description;
  final int? default_role;
  final int? id_personne;
  Role(
      {required this.id_role,
      this.role_description,
      this.default_role,
      this.id_personne});
  factory Role.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Role(
      id_role: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_role'])!,
      role_description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}role_description']),
      default_role: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}default_role']),
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_role'] = Variable<int>(id_role);
    if (!nullToAbsent || role_description != null) {
      map['role_description'] = Variable<String?>(role_description);
    }
    if (!nullToAbsent || default_role != null) {
      map['default_role'] = Variable<int?>(default_role);
    }
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
      id_role: Value(id_role),
      role_description: role_description == null && nullToAbsent
          ? const Value.absent()
          : Value(role_description),
      default_role: default_role == null && nullToAbsent
          ? const Value.absent()
          : Value(default_role),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
    );
  }

  factory Role.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Role(
      id_role: serializer.fromJson<int>(json['id_role']),
      role_description: serializer.fromJson<String?>(json['role_description']),
      default_role: serializer.fromJson<int?>(json['default_role']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_role': serializer.toJson<int>(id_role),
      'role_description': serializer.toJson<String?>(role_description),
      'default_role': serializer.toJson<int?>(default_role),
      'id_personne': serializer.toJson<int?>(id_personne),
    };
  }

  Role copyWith(
          {int? id_role,
          String? role_description,
          int? default_role,
          int? id_personne}) =>
      Role(
        id_role: id_role ?? this.id_role,
        role_description: role_description ?? this.role_description,
        default_role: default_role ?? this.default_role,
        id_personne: id_personne ?? this.id_personne,
      );
  @override
  String toString() {
    return (StringBuffer('Role(')
          ..write('id_role: $id_role, ')
          ..write('role_description: $role_description, ')
          ..write('default_role: $default_role, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id_role, role_description, default_role, id_personne);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Role &&
          other.id_role == this.id_role &&
          other.role_description == this.role_description &&
          other.default_role == this.default_role &&
          other.id_personne == this.id_personne);
}

class RolesCompanion extends UpdateCompanion<Role> {
  final Value<int> id_role;
  final Value<String?> role_description;
  final Value<int?> default_role;
  final Value<int?> id_personne;
  const RolesCompanion({
    this.id_role = const Value.absent(),
    this.role_description = const Value.absent(),
    this.default_role = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  RolesCompanion.insert({
    this.id_role = const Value.absent(),
    this.role_description = const Value.absent(),
    this.default_role = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  static Insertable<Role> custom({
    Expression<int>? id_role,
    Expression<String?>? role_description,
    Expression<int?>? default_role,
    Expression<int?>? id_personne,
  }) {
    return RawValuesInsertable({
      if (id_role != null) 'id_role': id_role,
      if (role_description != null) 'role_description': role_description,
      if (default_role != null) 'default_role': default_role,
      if (id_personne != null) 'id_personne': id_personne,
    });
  }

  RolesCompanion copyWith(
      {Value<int>? id_role,
      Value<String?>? role_description,
      Value<int?>? default_role,
      Value<int?>? id_personne}) {
    return RolesCompanion(
      id_role: id_role ?? this.id_role,
      role_description: role_description ?? this.role_description,
      default_role: default_role ?? this.default_role,
      id_personne: id_personne ?? this.id_personne,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_role.present) {
      map['id_role'] = Variable<int>(id_role.value);
    }
    if (role_description.present) {
      map['role_description'] = Variable<String?>(role_description.value);
    }
    if (default_role.present) {
      map['default_role'] = Variable<int?>(default_role.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('id_role: $id_role, ')
          ..write('role_description: $role_description, ')
          ..write('default_role: $default_role, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }
}

class $RolesTable extends Roles with TableInfo<$RolesTable, Role> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_roleMeta = const VerificationMeta('id_role');
  @override
  late final GeneratedColumn<int?> id_role = GeneratedColumn<int?>(
      'id_role', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _role_descriptionMeta =
      const VerificationMeta('role_description');
  @override
  late final GeneratedColumn<String?> role_description =
      GeneratedColumn<String?>('role_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _default_roleMeta =
      const VerificationMeta('default_role');
  @override
  late final GeneratedColumn<int?> default_role = GeneratedColumn<int?>(
      'default_role', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id_role, role_description, default_role, id_personne];
  @override
  String get aliasedName => _alias ?? 'roles';
  @override
  String get actualTableName => 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<Role> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_role')) {
      context.handle(_id_roleMeta,
          id_role.isAcceptableOrUnknown(data['id_role']!, _id_roleMeta));
    }
    if (data.containsKey('role_description')) {
      context.handle(
          _role_descriptionMeta,
          role_description.isAcceptableOrUnknown(
              data['role_description']!, _role_descriptionMeta));
    }
    if (data.containsKey('default_role')) {
      context.handle(
          _default_roleMeta,
          default_role.isAcceptableOrUnknown(
              data['default_role']!, _default_roleMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_role};
  @override
  Role map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Role.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RolesTable createAlias(String alias) {
    return $RolesTable(attachedDatabase, alias);
  }
}

class Enfant extends DataClass implements Insertable<Enfant> {
  final int id_personne;
  final String nom;
  final String prenom;
  final String? nom_arabe;
  final String? prenom_arabe;
  final String? identifiant;
  final String? cin;
  final String? gsm;
  final String? email;
  final String? genre;
  final String? token;
  final String? niveau;
  final String classe;
  final String? photo;
  final bool has_agenda;
  final bool has_devoir;
  final bool? has_cantine;
  final bool? has_ControlesNotes;
  final String? emploitempspdf;
  Enfant(
      {required this.id_personne,
      required this.nom,
      required this.prenom,
      this.nom_arabe,
      this.prenom_arabe,
      this.identifiant,
      this.cin,
      this.gsm,
      this.email,
      this.genre,
      this.token,
      this.niveau,
      required this.classe,
      this.photo,
      required this.has_agenda,
      required this.has_devoir,
      this.has_cantine,
      this.has_ControlesNotes,
      this.emploitempspdf});
  factory Enfant.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Enfant(
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      nom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom'])!,
      prenom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom'])!,
      nom_arabe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom_arabe']),
      prenom_arabe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom_arabe']),
      identifiant: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}identifiant']),
      cin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cin']),
      gsm: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gsm']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      genre: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre']),
      token: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}token']),
      niveau: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}niveau']),
      classe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}classe'])!,
      photo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}photo']),
      has_agenda: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}has_agenda'])!,
      has_devoir: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}has_devoir'])!,
      has_cantine: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}has_cantine']),
      has_ControlesNotes: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}has_controles_notes']),
      emploitempspdf: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emploitempspdf']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_personne'] = Variable<int>(id_personne);
    map['nom'] = Variable<String>(nom);
    map['prenom'] = Variable<String>(prenom);
    if (!nullToAbsent || nom_arabe != null) {
      map['nom_arabe'] = Variable<String?>(nom_arabe);
    }
    if (!nullToAbsent || prenom_arabe != null) {
      map['prenom_arabe'] = Variable<String?>(prenom_arabe);
    }
    if (!nullToAbsent || identifiant != null) {
      map['identifiant'] = Variable<String?>(identifiant);
    }
    if (!nullToAbsent || cin != null) {
      map['cin'] = Variable<String?>(cin);
    }
    if (!nullToAbsent || gsm != null) {
      map['gsm'] = Variable<String?>(gsm);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || genre != null) {
      map['genre'] = Variable<String?>(genre);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String?>(token);
    }
    if (!nullToAbsent || niveau != null) {
      map['niveau'] = Variable<String?>(niveau);
    }
    map['classe'] = Variable<String>(classe);
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<String?>(photo);
    }
    map['has_agenda'] = Variable<bool>(has_agenda);
    map['has_devoir'] = Variable<bool>(has_devoir);
    if (!nullToAbsent || has_cantine != null) {
      map['has_cantine'] = Variable<bool?>(has_cantine);
    }
    if (!nullToAbsent || has_ControlesNotes != null) {
      map['has_controles_notes'] = Variable<bool?>(has_ControlesNotes);
    }
    if (!nullToAbsent || emploitempspdf != null) {
      map['emploitempspdf'] = Variable<String?>(emploitempspdf);
    }
    return map;
  }

  EnfantsCompanion toCompanion(bool nullToAbsent) {
    return EnfantsCompanion(
      id_personne: Value(id_personne),
      nom: Value(nom),
      prenom: Value(prenom),
      nom_arabe: nom_arabe == null && nullToAbsent
          ? const Value.absent()
          : Value(nom_arabe),
      prenom_arabe: prenom_arabe == null && nullToAbsent
          ? const Value.absent()
          : Value(prenom_arabe),
      identifiant: identifiant == null && nullToAbsent
          ? const Value.absent()
          : Value(identifiant),
      cin: cin == null && nullToAbsent ? const Value.absent() : Value(cin),
      gsm: gsm == null && nullToAbsent ? const Value.absent() : Value(gsm),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      niveau:
          niveau == null && nullToAbsent ? const Value.absent() : Value(niveau),
      classe: Value(classe),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      has_agenda: Value(has_agenda),
      has_devoir: Value(has_devoir),
      has_cantine: has_cantine == null && nullToAbsent
          ? const Value.absent()
          : Value(has_cantine),
      has_ControlesNotes: has_ControlesNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(has_ControlesNotes),
      emploitempspdf: emploitempspdf == null && nullToAbsent
          ? const Value.absent()
          : Value(emploitempspdf),
    );
  }

  factory Enfant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Enfant(
      id_personne: serializer.fromJson<int>(json['id_personne']),
      nom: serializer.fromJson<String>(json['nom']),
      prenom: serializer.fromJson<String>(json['prenom']),
      nom_arabe: serializer.fromJson<String?>(json['nom_arabe']),
      prenom_arabe: serializer.fromJson<String?>(json['prenom_arabe']),
      identifiant: serializer.fromJson<String?>(json['identifiant']),
      cin: serializer.fromJson<String?>(json['cin']),
      gsm: serializer.fromJson<String?>(json['gsm']),
      email: serializer.fromJson<String?>(json['email']),
      genre: serializer.fromJson<String?>(json['genre']),
      token: serializer.fromJson<String?>(json['token']),
      niveau: serializer.fromJson<String?>(json['niveau']),
      classe: serializer.fromJson<String>(json['classe']),
      photo: serializer.fromJson<String?>(json['photo']),
      has_agenda: serializer.fromJson<bool>(json['has_agenda']),
      has_devoir: serializer.fromJson<bool>(json['has_devoir']),
      has_cantine: serializer.fromJson<bool?>(json['has_cantine']),
      has_ControlesNotes:
          serializer.fromJson<bool?>(json['has_ControlesNotes']),
      emploitempspdf: serializer.fromJson<String?>(json['emploitempspdf']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_personne': serializer.toJson<int>(id_personne),
      'nom': serializer.toJson<String>(nom),
      'prenom': serializer.toJson<String>(prenom),
      'nom_arabe': serializer.toJson<String?>(nom_arabe),
      'prenom_arabe': serializer.toJson<String?>(prenom_arabe),
      'identifiant': serializer.toJson<String?>(identifiant),
      'cin': serializer.toJson<String?>(cin),
      'gsm': serializer.toJson<String?>(gsm),
      'email': serializer.toJson<String?>(email),
      'genre': serializer.toJson<String?>(genre),
      'token': serializer.toJson<String?>(token),
      'niveau': serializer.toJson<String?>(niveau),
      'classe': serializer.toJson<String>(classe),
      'photo': serializer.toJson<String?>(photo),
      'has_agenda': serializer.toJson<bool>(has_agenda),
      'has_devoir': serializer.toJson<bool>(has_devoir),
      'has_cantine': serializer.toJson<bool?>(has_cantine),
      'has_ControlesNotes': serializer.toJson<bool?>(has_ControlesNotes),
      'emploitempspdf': serializer.toJson<String?>(emploitempspdf),
    };
  }

  Enfant copyWith(
          {int? id_personne,
          String? nom,
          String? prenom,
          String? nom_arabe,
          String? prenom_arabe,
          String? identifiant,
          String? cin,
          String? gsm,
          String? email,
          String? genre,
          String? token,
          String? niveau,
          String? classe,
          String? photo,
          bool? has_agenda,
          bool? has_devoir,
          bool? has_cantine,
          bool? has_ControlesNotes,
          String? emploitempspdf}) =>
      Enfant(
        id_personne: id_personne ?? this.id_personne,
        nom: nom ?? this.nom,
        prenom: prenom ?? this.prenom,
        nom_arabe: nom_arabe ?? this.nom_arabe,
        prenom_arabe: prenom_arabe ?? this.prenom_arabe,
        identifiant: identifiant ?? this.identifiant,
        cin: cin ?? this.cin,
        gsm: gsm ?? this.gsm,
        email: email ?? this.email,
        genre: genre ?? this.genre,
        token: token ?? this.token,
        niveau: niveau ?? this.niveau,
        classe: classe ?? this.classe,
        photo: photo ?? this.photo,
        has_agenda: has_agenda ?? this.has_agenda,
        has_devoir: has_devoir ?? this.has_devoir,
        has_cantine: has_cantine ?? this.has_cantine,
        has_ControlesNotes: has_ControlesNotes ?? this.has_ControlesNotes,
        emploitempspdf: emploitempspdf ?? this.emploitempspdf,
      );
  @override
  String toString() {
    return (StringBuffer('Enfant(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('nom_arabe: $nom_arabe, ')
          ..write('prenom_arabe: $prenom_arabe, ')
          ..write('identifiant: $identifiant, ')
          ..write('cin: $cin, ')
          ..write('gsm: $gsm, ')
          ..write('email: $email, ')
          ..write('genre: $genre, ')
          ..write('token: $token, ')
          ..write('niveau: $niveau, ')
          ..write('classe: $classe, ')
          ..write('photo: $photo, ')
          ..write('has_agenda: $has_agenda, ')
          ..write('has_devoir: $has_devoir, ')
          ..write('has_cantine: $has_cantine, ')
          ..write('has_ControlesNotes: $has_ControlesNotes, ')
          ..write('emploitempspdf: $emploitempspdf')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_personne,
      nom,
      prenom,
      nom_arabe,
      prenom_arabe,
      identifiant,
      cin,
      gsm,
      email,
      genre,
      token,
      niveau,
      classe,
      photo,
      has_agenda,
      has_devoir,
      has_cantine,
      has_ControlesNotes,
      emploitempspdf);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enfant &&
          other.id_personne == this.id_personne &&
          other.nom == this.nom &&
          other.prenom == this.prenom &&
          other.nom_arabe == this.nom_arabe &&
          other.prenom_arabe == this.prenom_arabe &&
          other.identifiant == this.identifiant &&
          other.cin == this.cin &&
          other.gsm == this.gsm &&
          other.email == this.email &&
          other.genre == this.genre &&
          other.token == this.token &&
          other.niveau == this.niveau &&
          other.classe == this.classe &&
          other.photo == this.photo &&
          other.has_agenda == this.has_agenda &&
          other.has_devoir == this.has_devoir &&
          other.has_cantine == this.has_cantine &&
          other.has_ControlesNotes == this.has_ControlesNotes &&
          other.emploitempspdf == this.emploitempspdf);
}

class EnfantsCompanion extends UpdateCompanion<Enfant> {
  final Value<int> id_personne;
  final Value<String> nom;
  final Value<String> prenom;
  final Value<String?> nom_arabe;
  final Value<String?> prenom_arabe;
  final Value<String?> identifiant;
  final Value<String?> cin;
  final Value<String?> gsm;
  final Value<String?> email;
  final Value<String?> genre;
  final Value<String?> token;
  final Value<String?> niveau;
  final Value<String> classe;
  final Value<String?> photo;
  final Value<bool> has_agenda;
  final Value<bool> has_devoir;
  final Value<bool?> has_cantine;
  final Value<bool?> has_ControlesNotes;
  final Value<String?> emploitempspdf;
  const EnfantsCompanion({
    this.id_personne = const Value.absent(),
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.nom_arabe = const Value.absent(),
    this.prenom_arabe = const Value.absent(),
    this.identifiant = const Value.absent(),
    this.cin = const Value.absent(),
    this.gsm = const Value.absent(),
    this.email = const Value.absent(),
    this.genre = const Value.absent(),
    this.token = const Value.absent(),
    this.niveau = const Value.absent(),
    this.classe = const Value.absent(),
    this.photo = const Value.absent(),
    this.has_agenda = const Value.absent(),
    this.has_devoir = const Value.absent(),
    this.has_cantine = const Value.absent(),
    this.has_ControlesNotes = const Value.absent(),
    this.emploitempspdf = const Value.absent(),
  });
  EnfantsCompanion.insert({
    this.id_personne = const Value.absent(),
    required String nom,
    required String prenom,
    this.nom_arabe = const Value.absent(),
    this.prenom_arabe = const Value.absent(),
    this.identifiant = const Value.absent(),
    this.cin = const Value.absent(),
    this.gsm = const Value.absent(),
    this.email = const Value.absent(),
    this.genre = const Value.absent(),
    this.token = const Value.absent(),
    this.niveau = const Value.absent(),
    required String classe,
    this.photo = const Value.absent(),
    this.has_agenda = const Value.absent(),
    this.has_devoir = const Value.absent(),
    this.has_cantine = const Value.absent(),
    this.has_ControlesNotes = const Value.absent(),
    this.emploitempspdf = const Value.absent(),
  })  : nom = Value(nom),
        prenom = Value(prenom),
        classe = Value(classe);
  static Insertable<Enfant> custom({
    Expression<int>? id_personne,
    Expression<String>? nom,
    Expression<String>? prenom,
    Expression<String?>? nom_arabe,
    Expression<String?>? prenom_arabe,
    Expression<String?>? identifiant,
    Expression<String?>? cin,
    Expression<String?>? gsm,
    Expression<String?>? email,
    Expression<String?>? genre,
    Expression<String?>? token,
    Expression<String?>? niveau,
    Expression<String>? classe,
    Expression<String?>? photo,
    Expression<bool>? has_agenda,
    Expression<bool>? has_devoir,
    Expression<bool?>? has_cantine,
    Expression<bool?>? has_ControlesNotes,
    Expression<String?>? emploitempspdf,
  }) {
    return RawValuesInsertable({
      if (id_personne != null) 'id_personne': id_personne,
      if (nom != null) 'nom': nom,
      if (prenom != null) 'prenom': prenom,
      if (nom_arabe != null) 'nom_arabe': nom_arabe,
      if (prenom_arabe != null) 'prenom_arabe': prenom_arabe,
      if (identifiant != null) 'identifiant': identifiant,
      if (cin != null) 'cin': cin,
      if (gsm != null) 'gsm': gsm,
      if (email != null) 'email': email,
      if (genre != null) 'genre': genre,
      if (token != null) 'token': token,
      if (niveau != null) 'niveau': niveau,
      if (classe != null) 'classe': classe,
      if (photo != null) 'photo': photo,
      if (has_agenda != null) 'has_agenda': has_agenda,
      if (has_devoir != null) 'has_devoir': has_devoir,
      if (has_cantine != null) 'has_cantine': has_cantine,
      if (has_ControlesNotes != null) 'has_controles_notes': has_ControlesNotes,
      if (emploitempspdf != null) 'emploitempspdf': emploitempspdf,
    });
  }

  EnfantsCompanion copyWith(
      {Value<int>? id_personne,
      Value<String>? nom,
      Value<String>? prenom,
      Value<String?>? nom_arabe,
      Value<String?>? prenom_arabe,
      Value<String?>? identifiant,
      Value<String?>? cin,
      Value<String?>? gsm,
      Value<String?>? email,
      Value<String?>? genre,
      Value<String?>? token,
      Value<String?>? niveau,
      Value<String>? classe,
      Value<String?>? photo,
      Value<bool>? has_agenda,
      Value<bool>? has_devoir,
      Value<bool?>? has_cantine,
      Value<bool?>? has_ControlesNotes,
      Value<String?>? emploitempspdf}) {
    return EnfantsCompanion(
      id_personne: id_personne ?? this.id_personne,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      nom_arabe: nom_arabe ?? this.nom_arabe,
      prenom_arabe: prenom_arabe ?? this.prenom_arabe,
      identifiant: identifiant ?? this.identifiant,
      cin: cin ?? this.cin,
      gsm: gsm ?? this.gsm,
      email: email ?? this.email,
      genre: genre ?? this.genre,
      token: token ?? this.token,
      niveau: niveau ?? this.niveau,
      classe: classe ?? this.classe,
      photo: photo ?? this.photo,
      has_agenda: has_agenda ?? this.has_agenda,
      has_devoir: has_devoir ?? this.has_devoir,
      has_cantine: has_cantine ?? this.has_cantine,
      has_ControlesNotes: has_ControlesNotes ?? this.has_ControlesNotes,
      emploitempspdf: emploitempspdf ?? this.emploitempspdf,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String>(nom.value);
    }
    if (prenom.present) {
      map['prenom'] = Variable<String>(prenom.value);
    }
    if (nom_arabe.present) {
      map['nom_arabe'] = Variable<String?>(nom_arabe.value);
    }
    if (prenom_arabe.present) {
      map['prenom_arabe'] = Variable<String?>(prenom_arabe.value);
    }
    if (identifiant.present) {
      map['identifiant'] = Variable<String?>(identifiant.value);
    }
    if (cin.present) {
      map['cin'] = Variable<String?>(cin.value);
    }
    if (gsm.present) {
      map['gsm'] = Variable<String?>(gsm.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String?>(genre.value);
    }
    if (token.present) {
      map['token'] = Variable<String?>(token.value);
    }
    if (niveau.present) {
      map['niveau'] = Variable<String?>(niveau.value);
    }
    if (classe.present) {
      map['classe'] = Variable<String>(classe.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String?>(photo.value);
    }
    if (has_agenda.present) {
      map['has_agenda'] = Variable<bool>(has_agenda.value);
    }
    if (has_devoir.present) {
      map['has_devoir'] = Variable<bool>(has_devoir.value);
    }
    if (has_cantine.present) {
      map['has_cantine'] = Variable<bool?>(has_cantine.value);
    }
    if (has_ControlesNotes.present) {
      map['has_controles_notes'] = Variable<bool?>(has_ControlesNotes.value);
    }
    if (emploitempspdf.present) {
      map['emploitempspdf'] = Variable<String?>(emploitempspdf.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnfantsCompanion(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('nom_arabe: $nom_arabe, ')
          ..write('prenom_arabe: $prenom_arabe, ')
          ..write('identifiant: $identifiant, ')
          ..write('cin: $cin, ')
          ..write('gsm: $gsm, ')
          ..write('email: $email, ')
          ..write('genre: $genre, ')
          ..write('token: $token, ')
          ..write('niveau: $niveau, ')
          ..write('classe: $classe, ')
          ..write('photo: $photo, ')
          ..write('has_agenda: $has_agenda, ')
          ..write('has_devoir: $has_devoir, ')
          ..write('has_cantine: $has_cantine, ')
          ..write('has_ControlesNotes: $has_ControlesNotes, ')
          ..write('emploitempspdf: $emploitempspdf')
          ..write(')'))
        .toString();
  }
}

class $EnfantsTable extends Enfants with TableInfo<$EnfantsTable, Enfant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnfantsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String?> nom = GeneratedColumn<String?>(
      'nom', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _prenomMeta = const VerificationMeta('prenom');
  @override
  late final GeneratedColumn<String?> prenom = GeneratedColumn<String?>(
      'prenom', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nom_arabeMeta = const VerificationMeta('nom_arabe');
  @override
  late final GeneratedColumn<String?> nom_arabe = GeneratedColumn<String?>(
      'nom_arabe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _prenom_arabeMeta =
      const VerificationMeta('prenom_arabe');
  @override
  late final GeneratedColumn<String?> prenom_arabe = GeneratedColumn<String?>(
      'prenom_arabe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _identifiantMeta =
      const VerificationMeta('identifiant');
  @override
  late final GeneratedColumn<String?> identifiant = GeneratedColumn<String?>(
      'identifiant', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _cinMeta = const VerificationMeta('cin');
  @override
  late final GeneratedColumn<String?> cin = GeneratedColumn<String?>(
      'cin', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _gsmMeta = const VerificationMeta('gsm');
  @override
  late final GeneratedColumn<String?> gsm = GeneratedColumn<String?>(
      'gsm', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String?> genre = GeneratedColumn<String?>(
      'genre', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String?> token = GeneratedColumn<String?>(
      'token', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _niveauMeta = const VerificationMeta('niveau');
  @override
  late final GeneratedColumn<String?> niveau = GeneratedColumn<String?>(
      'niveau', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _classeMeta = const VerificationMeta('classe');
  @override
  late final GeneratedColumn<String?> classe = GeneratedColumn<String?>(
      'classe', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String?> photo = GeneratedColumn<String?>(
      'photo', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _has_agendaMeta = const VerificationMeta('has_agenda');
  @override
  late final GeneratedColumn<bool?> has_agenda = GeneratedColumn<bool?>(
      'has_agenda', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (has_agenda IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _has_devoirMeta = const VerificationMeta('has_devoir');
  @override
  late final GeneratedColumn<bool?> has_devoir = GeneratedColumn<bool?>(
      'has_devoir', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (has_devoir IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _has_cantineMeta =
      const VerificationMeta('has_cantine');
  @override
  late final GeneratedColumn<bool?> has_cantine = GeneratedColumn<bool?>(
      'has_cantine', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (has_cantine IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _has_ControlesNotesMeta =
      const VerificationMeta('has_ControlesNotes');
  @override
  late final GeneratedColumn<bool?> has_ControlesNotes = GeneratedColumn<bool?>(
      'has_controles_notes', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (has_controles_notes IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _emploitempspdfMeta =
      const VerificationMeta('emploitempspdf');
  @override
  late final GeneratedColumn<String?> emploitempspdf = GeneratedColumn<String?>(
      'emploitempspdf', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_personne,
        nom,
        prenom,
        nom_arabe,
        prenom_arabe,
        identifiant,
        cin,
        gsm,
        email,
        genre,
        token,
        niveau,
        classe,
        photo,
        has_agenda,
        has_devoir,
        has_cantine,
        has_ControlesNotes,
        emploitempspdf
      ];
  @override
  String get aliasedName => _alias ?? 'enfants';
  @override
  String get actualTableName => 'enfants';
  @override
  VerificationContext validateIntegrity(Insertable<Enfant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    if (data.containsKey('nom')) {
      context.handle(
          _nomMeta, nom.isAcceptableOrUnknown(data['nom']!, _nomMeta));
    } else if (isInserting) {
      context.missing(_nomMeta);
    }
    if (data.containsKey('prenom')) {
      context.handle(_prenomMeta,
          prenom.isAcceptableOrUnknown(data['prenom']!, _prenomMeta));
    } else if (isInserting) {
      context.missing(_prenomMeta);
    }
    if (data.containsKey('nom_arabe')) {
      context.handle(_nom_arabeMeta,
          nom_arabe.isAcceptableOrUnknown(data['nom_arabe']!, _nom_arabeMeta));
    }
    if (data.containsKey('prenom_arabe')) {
      context.handle(
          _prenom_arabeMeta,
          prenom_arabe.isAcceptableOrUnknown(
              data['prenom_arabe']!, _prenom_arabeMeta));
    }
    if (data.containsKey('identifiant')) {
      context.handle(
          _identifiantMeta,
          identifiant.isAcceptableOrUnknown(
              data['identifiant']!, _identifiantMeta));
    }
    if (data.containsKey('cin')) {
      context.handle(
          _cinMeta, cin.isAcceptableOrUnknown(data['cin']!, _cinMeta));
    }
    if (data.containsKey('gsm')) {
      context.handle(
          _gsmMeta, gsm.isAcceptableOrUnknown(data['gsm']!, _gsmMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    }
    if (data.containsKey('niveau')) {
      context.handle(_niveauMeta,
          niveau.isAcceptableOrUnknown(data['niveau']!, _niveauMeta));
    }
    if (data.containsKey('classe')) {
      context.handle(_classeMeta,
          classe.isAcceptableOrUnknown(data['classe']!, _classeMeta));
    } else if (isInserting) {
      context.missing(_classeMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    }
    if (data.containsKey('has_agenda')) {
      context.handle(
          _has_agendaMeta,
          has_agenda.isAcceptableOrUnknown(
              data['has_agenda']!, _has_agendaMeta));
    }
    if (data.containsKey('has_devoir')) {
      context.handle(
          _has_devoirMeta,
          has_devoir.isAcceptableOrUnknown(
              data['has_devoir']!, _has_devoirMeta));
    }
    if (data.containsKey('has_cantine')) {
      context.handle(
          _has_cantineMeta,
          has_cantine.isAcceptableOrUnknown(
              data['has_cantine']!, _has_cantineMeta));
    }
    if (data.containsKey('has_controles_notes')) {
      context.handle(
          _has_ControlesNotesMeta,
          has_ControlesNotes.isAcceptableOrUnknown(
              data['has_controles_notes']!, _has_ControlesNotesMeta));
    }
    if (data.containsKey('emploitempspdf')) {
      context.handle(
          _emploitempspdfMeta,
          emploitempspdf.isAcceptableOrUnknown(
              data['emploitempspdf']!, _emploitempspdfMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_personne};
  @override
  Enfant map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Enfant.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EnfantsTable createAlias(String alias) {
    return $EnfantsTable(attachedDatabase, alias);
  }
}

class JoursFerie extends DataClass implements Insertable<JoursFerie> {
  final int id_jours_feries;
  final String? description_jour_ferie;
  final DateTime? date_debut_jour_ferie;
  final DateTime? date_fin_jour_ferie;
  final DateTime? lastupdate;
  JoursFerie(
      {required this.id_jours_feries,
      this.description_jour_ferie,
      this.date_debut_jour_ferie,
      this.date_fin_jour_ferie,
      this.lastupdate});
  factory JoursFerie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return JoursFerie(
      id_jours_feries: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_jours_feries'])!,
      description_jour_ferie: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}description_jour_ferie']),
      date_debut_jour_ferie: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_debut_jour_ferie']),
      date_fin_jour_ferie: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_fin_jour_ferie']),
      lastupdate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lastupdate']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_jours_feries'] = Variable<int>(id_jours_feries);
    if (!nullToAbsent || description_jour_ferie != null) {
      map['description_jour_ferie'] = Variable<String?>(description_jour_ferie);
    }
    if (!nullToAbsent || date_debut_jour_ferie != null) {
      map['date_debut_jour_ferie'] = Variable<DateTime?>(date_debut_jour_ferie);
    }
    if (!nullToAbsent || date_fin_jour_ferie != null) {
      map['date_fin_jour_ferie'] = Variable<DateTime?>(date_fin_jour_ferie);
    }
    if (!nullToAbsent || lastupdate != null) {
      map['lastupdate'] = Variable<DateTime?>(lastupdate);
    }
    return map;
  }

  JoursFeriesCompanion toCompanion(bool nullToAbsent) {
    return JoursFeriesCompanion(
      id_jours_feries: Value(id_jours_feries),
      description_jour_ferie: description_jour_ferie == null && nullToAbsent
          ? const Value.absent()
          : Value(description_jour_ferie),
      date_debut_jour_ferie: date_debut_jour_ferie == null && nullToAbsent
          ? const Value.absent()
          : Value(date_debut_jour_ferie),
      date_fin_jour_ferie: date_fin_jour_ferie == null && nullToAbsent
          ? const Value.absent()
          : Value(date_fin_jour_ferie),
      lastupdate: lastupdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastupdate),
    );
  }

  factory JoursFerie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return JoursFerie(
      id_jours_feries: serializer.fromJson<int>(json['id_jours_feries']),
      description_jour_ferie:
          serializer.fromJson<String?>(json['description_jour_ferie']),
      date_debut_jour_ferie:
          serializer.fromJson<DateTime?>(json['date_debut_jour_ferie']),
      date_fin_jour_ferie:
          serializer.fromJson<DateTime?>(json['date_fin_jour_ferie']),
      lastupdate: serializer.fromJson<DateTime?>(json['lastupdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_jours_feries': serializer.toJson<int>(id_jours_feries),
      'description_jour_ferie':
          serializer.toJson<String?>(description_jour_ferie),
      'date_debut_jour_ferie':
          serializer.toJson<DateTime?>(date_debut_jour_ferie),
      'date_fin_jour_ferie': serializer.toJson<DateTime?>(date_fin_jour_ferie),
      'lastupdate': serializer.toJson<DateTime?>(lastupdate),
    };
  }

  JoursFerie copyWith(
          {int? id_jours_feries,
          String? description_jour_ferie,
          DateTime? date_debut_jour_ferie,
          DateTime? date_fin_jour_ferie,
          DateTime? lastupdate}) =>
      JoursFerie(
        id_jours_feries: id_jours_feries ?? this.id_jours_feries,
        description_jour_ferie:
            description_jour_ferie ?? this.description_jour_ferie,
        date_debut_jour_ferie:
            date_debut_jour_ferie ?? this.date_debut_jour_ferie,
        date_fin_jour_ferie: date_fin_jour_ferie ?? this.date_fin_jour_ferie,
        lastupdate: lastupdate ?? this.lastupdate,
      );
  @override
  String toString() {
    return (StringBuffer('JoursFerie(')
          ..write('id_jours_feries: $id_jours_feries, ')
          ..write('description_jour_ferie: $description_jour_ferie, ')
          ..write('date_debut_jour_ferie: $date_debut_jour_ferie, ')
          ..write('date_fin_jour_ferie: $date_fin_jour_ferie, ')
          ..write('lastupdate: $lastupdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_jours_feries, description_jour_ferie,
      date_debut_jour_ferie, date_fin_jour_ferie, lastupdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JoursFerie &&
          other.id_jours_feries == this.id_jours_feries &&
          other.description_jour_ferie == this.description_jour_ferie &&
          other.date_debut_jour_ferie == this.date_debut_jour_ferie &&
          other.date_fin_jour_ferie == this.date_fin_jour_ferie &&
          other.lastupdate == this.lastupdate);
}

class JoursFeriesCompanion extends UpdateCompanion<JoursFerie> {
  final Value<int> id_jours_feries;
  final Value<String?> description_jour_ferie;
  final Value<DateTime?> date_debut_jour_ferie;
  final Value<DateTime?> date_fin_jour_ferie;
  final Value<DateTime?> lastupdate;
  const JoursFeriesCompanion({
    this.id_jours_feries = const Value.absent(),
    this.description_jour_ferie = const Value.absent(),
    this.date_debut_jour_ferie = const Value.absent(),
    this.date_fin_jour_ferie = const Value.absent(),
    this.lastupdate = const Value.absent(),
  });
  JoursFeriesCompanion.insert({
    this.id_jours_feries = const Value.absent(),
    this.description_jour_ferie = const Value.absent(),
    this.date_debut_jour_ferie = const Value.absent(),
    this.date_fin_jour_ferie = const Value.absent(),
    this.lastupdate = const Value.absent(),
  });
  static Insertable<JoursFerie> custom({
    Expression<int>? id_jours_feries,
    Expression<String?>? description_jour_ferie,
    Expression<DateTime?>? date_debut_jour_ferie,
    Expression<DateTime?>? date_fin_jour_ferie,
    Expression<DateTime?>? lastupdate,
  }) {
    return RawValuesInsertable({
      if (id_jours_feries != null) 'id_jours_feries': id_jours_feries,
      if (description_jour_ferie != null)
        'description_jour_ferie': description_jour_ferie,
      if (date_debut_jour_ferie != null)
        'date_debut_jour_ferie': date_debut_jour_ferie,
      if (date_fin_jour_ferie != null)
        'date_fin_jour_ferie': date_fin_jour_ferie,
      if (lastupdate != null) 'lastupdate': lastupdate,
    });
  }

  JoursFeriesCompanion copyWith(
      {Value<int>? id_jours_feries,
      Value<String?>? description_jour_ferie,
      Value<DateTime?>? date_debut_jour_ferie,
      Value<DateTime?>? date_fin_jour_ferie,
      Value<DateTime?>? lastupdate}) {
    return JoursFeriesCompanion(
      id_jours_feries: id_jours_feries ?? this.id_jours_feries,
      description_jour_ferie:
          description_jour_ferie ?? this.description_jour_ferie,
      date_debut_jour_ferie:
          date_debut_jour_ferie ?? this.date_debut_jour_ferie,
      date_fin_jour_ferie: date_fin_jour_ferie ?? this.date_fin_jour_ferie,
      lastupdate: lastupdate ?? this.lastupdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_jours_feries.present) {
      map['id_jours_feries'] = Variable<int>(id_jours_feries.value);
    }
    if (description_jour_ferie.present) {
      map['description_jour_ferie'] =
          Variable<String?>(description_jour_ferie.value);
    }
    if (date_debut_jour_ferie.present) {
      map['date_debut_jour_ferie'] =
          Variable<DateTime?>(date_debut_jour_ferie.value);
    }
    if (date_fin_jour_ferie.present) {
      map['date_fin_jour_ferie'] =
          Variable<DateTime?>(date_fin_jour_ferie.value);
    }
    if (lastupdate.present) {
      map['lastupdate'] = Variable<DateTime?>(lastupdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JoursFeriesCompanion(')
          ..write('id_jours_feries: $id_jours_feries, ')
          ..write('description_jour_ferie: $description_jour_ferie, ')
          ..write('date_debut_jour_ferie: $date_debut_jour_ferie, ')
          ..write('date_fin_jour_ferie: $date_fin_jour_ferie, ')
          ..write('lastupdate: $lastupdate')
          ..write(')'))
        .toString();
  }
}

class $JoursFeriesTable extends JoursFeries
    with TableInfo<$JoursFeriesTable, JoursFerie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JoursFeriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_jours_feriesMeta =
      const VerificationMeta('id_jours_feries');
  @override
  late final GeneratedColumn<int?> id_jours_feries = GeneratedColumn<int?>(
      'id_jours_feries', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _description_jour_ferieMeta =
      const VerificationMeta('description_jour_ferie');
  @override
  late final GeneratedColumn<String?> description_jour_ferie =
      GeneratedColumn<String?>('description_jour_ferie', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _date_debut_jour_ferieMeta =
      const VerificationMeta('date_debut_jour_ferie');
  @override
  late final GeneratedColumn<DateTime?> date_debut_jour_ferie =
      GeneratedColumn<DateTime?>('date_debut_jour_ferie', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _date_fin_jour_ferieMeta =
      const VerificationMeta('date_fin_jour_ferie');
  @override
  late final GeneratedColumn<DateTime?> date_fin_jour_ferie =
      GeneratedColumn<DateTime?>('date_fin_jour_ferie', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _lastupdateMeta = const VerificationMeta('lastupdate');
  @override
  late final GeneratedColumn<DateTime?> lastupdate = GeneratedColumn<DateTime?>(
      'lastupdate', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_jours_feries,
        description_jour_ferie,
        date_debut_jour_ferie,
        date_fin_jour_ferie,
        lastupdate
      ];
  @override
  String get aliasedName => _alias ?? 'jours_feries';
  @override
  String get actualTableName => 'jours_feries';
  @override
  VerificationContext validateIntegrity(Insertable<JoursFerie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_jours_feries')) {
      context.handle(
          _id_jours_feriesMeta,
          id_jours_feries.isAcceptableOrUnknown(
              data['id_jours_feries']!, _id_jours_feriesMeta));
    }
    if (data.containsKey('description_jour_ferie')) {
      context.handle(
          _description_jour_ferieMeta,
          description_jour_ferie.isAcceptableOrUnknown(
              data['description_jour_ferie']!, _description_jour_ferieMeta));
    }
    if (data.containsKey('date_debut_jour_ferie')) {
      context.handle(
          _date_debut_jour_ferieMeta,
          date_debut_jour_ferie.isAcceptableOrUnknown(
              data['date_debut_jour_ferie']!, _date_debut_jour_ferieMeta));
    }
    if (data.containsKey('date_fin_jour_ferie')) {
      context.handle(
          _date_fin_jour_ferieMeta,
          date_fin_jour_ferie.isAcceptableOrUnknown(
              data['date_fin_jour_ferie']!, _date_fin_jour_ferieMeta));
    }
    if (data.containsKey('lastupdate')) {
      context.handle(
          _lastupdateMeta,
          lastupdate.isAcceptableOrUnknown(
              data['lastupdate']!, _lastupdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_jours_feries};
  @override
  JoursFerie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return JoursFerie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $JoursFeriesTable createAlias(String alias) {
    return $JoursFeriesTable(attachedDatabase, alias);
  }
}

class Evenement extends DataClass implements Insertable<Evenement> {
  final int id_evenement;
  final int id_personne;
  final String? titre;
  final String? description;
  final DateTime debut;
  final DateTime fin;
  final DateTime? lastupdate;
  Evenement(
      {required this.id_evenement,
      required this.id_personne,
      this.titre,
      this.description,
      required this.debut,
      required this.fin,
      this.lastupdate});
  factory Evenement.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Evenement(
      id_evenement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_evenement'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      titre: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}titre']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      debut: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}debut'])!,
      fin: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fin'])!,
      lastupdate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lastupdate']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_evenement'] = Variable<int>(id_evenement);
    map['id_personne'] = Variable<int>(id_personne);
    if (!nullToAbsent || titre != null) {
      map['titre'] = Variable<String?>(titre);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['debut'] = Variable<DateTime>(debut);
    map['fin'] = Variable<DateTime>(fin);
    if (!nullToAbsent || lastupdate != null) {
      map['lastupdate'] = Variable<DateTime?>(lastupdate);
    }
    return map;
  }

  EvenementsCompanion toCompanion(bool nullToAbsent) {
    return EvenementsCompanion(
      id_evenement: Value(id_evenement),
      id_personne: Value(id_personne),
      titre:
          titre == null && nullToAbsent ? const Value.absent() : Value(titre),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      debut: Value(debut),
      fin: Value(fin),
      lastupdate: lastupdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastupdate),
    );
  }

  factory Evenement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Evenement(
      id_evenement: serializer.fromJson<int>(json['id_evenement']),
      id_personne: serializer.fromJson<int>(json['id_personne']),
      titre: serializer.fromJson<String?>(json['titre']),
      description: serializer.fromJson<String?>(json['description']),
      debut: serializer.fromJson<DateTime>(json['debut']),
      fin: serializer.fromJson<DateTime>(json['fin']),
      lastupdate: serializer.fromJson<DateTime?>(json['lastupdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_evenement': serializer.toJson<int>(id_evenement),
      'id_personne': serializer.toJson<int>(id_personne),
      'titre': serializer.toJson<String?>(titre),
      'description': serializer.toJson<String?>(description),
      'debut': serializer.toJson<DateTime>(debut),
      'fin': serializer.toJson<DateTime>(fin),
      'lastupdate': serializer.toJson<DateTime?>(lastupdate),
    };
  }

  Evenement copyWith(
          {int? id_evenement,
          int? id_personne,
          String? titre,
          String? description,
          DateTime? debut,
          DateTime? fin,
          DateTime? lastupdate}) =>
      Evenement(
        id_evenement: id_evenement ?? this.id_evenement,
        id_personne: id_personne ?? this.id_personne,
        titre: titre ?? this.titre,
        description: description ?? this.description,
        debut: debut ?? this.debut,
        fin: fin ?? this.fin,
        lastupdate: lastupdate ?? this.lastupdate,
      );
  @override
  String toString() {
    return (StringBuffer('Evenement(')
          ..write('id_evenement: $id_evenement, ')
          ..write('id_personne: $id_personne, ')
          ..write('titre: $titre, ')
          ..write('description: $description, ')
          ..write('debut: $debut, ')
          ..write('fin: $fin, ')
          ..write('lastupdate: $lastupdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_evenement, id_personne, titre, description, debut, fin, lastupdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Evenement &&
          other.id_evenement == this.id_evenement &&
          other.id_personne == this.id_personne &&
          other.titre == this.titre &&
          other.description == this.description &&
          other.debut == this.debut &&
          other.fin == this.fin &&
          other.lastupdate == this.lastupdate);
}

class EvenementsCompanion extends UpdateCompanion<Evenement> {
  final Value<int> id_evenement;
  final Value<int> id_personne;
  final Value<String?> titre;
  final Value<String?> description;
  final Value<DateTime> debut;
  final Value<DateTime> fin;
  final Value<DateTime?> lastupdate;
  const EvenementsCompanion({
    this.id_evenement = const Value.absent(),
    this.id_personne = const Value.absent(),
    this.titre = const Value.absent(),
    this.description = const Value.absent(),
    this.debut = const Value.absent(),
    this.fin = const Value.absent(),
    this.lastupdate = const Value.absent(),
  });
  EvenementsCompanion.insert({
    this.id_evenement = const Value.absent(),
    required int id_personne,
    this.titre = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime debut,
    required DateTime fin,
    this.lastupdate = const Value.absent(),
  })  : id_personne = Value(id_personne),
        debut = Value(debut),
        fin = Value(fin);
  static Insertable<Evenement> custom({
    Expression<int>? id_evenement,
    Expression<int>? id_personne,
    Expression<String?>? titre,
    Expression<String?>? description,
    Expression<DateTime>? debut,
    Expression<DateTime>? fin,
    Expression<DateTime?>? lastupdate,
  }) {
    return RawValuesInsertable({
      if (id_evenement != null) 'id_evenement': id_evenement,
      if (id_personne != null) 'id_personne': id_personne,
      if (titre != null) 'titre': titre,
      if (description != null) 'description': description,
      if (debut != null) 'debut': debut,
      if (fin != null) 'fin': fin,
      if (lastupdate != null) 'lastupdate': lastupdate,
    });
  }

  EvenementsCompanion copyWith(
      {Value<int>? id_evenement,
      Value<int>? id_personne,
      Value<String?>? titre,
      Value<String?>? description,
      Value<DateTime>? debut,
      Value<DateTime>? fin,
      Value<DateTime?>? lastupdate}) {
    return EvenementsCompanion(
      id_evenement: id_evenement ?? this.id_evenement,
      id_personne: id_personne ?? this.id_personne,
      titre: titre ?? this.titre,
      description: description ?? this.description,
      debut: debut ?? this.debut,
      fin: fin ?? this.fin,
      lastupdate: lastupdate ?? this.lastupdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_evenement.present) {
      map['id_evenement'] = Variable<int>(id_evenement.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (titre.present) {
      map['titre'] = Variable<String?>(titre.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (debut.present) {
      map['debut'] = Variable<DateTime>(debut.value);
    }
    if (fin.present) {
      map['fin'] = Variable<DateTime>(fin.value);
    }
    if (lastupdate.present) {
      map['lastupdate'] = Variable<DateTime?>(lastupdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvenementsCompanion(')
          ..write('id_evenement: $id_evenement, ')
          ..write('id_personne: $id_personne, ')
          ..write('titre: $titre, ')
          ..write('description: $description, ')
          ..write('debut: $debut, ')
          ..write('fin: $fin, ')
          ..write('lastupdate: $lastupdate')
          ..write(')'))
        .toString();
  }
}

class $EvenementsTable extends Evenements
    with TableInfo<$EvenementsTable, Evenement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvenementsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_evenementMeta =
      const VerificationMeta('id_evenement');
  @override
  late final GeneratedColumn<int?> id_evenement = GeneratedColumn<int?>(
      'id_evenement', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titreMeta = const VerificationMeta('titre');
  @override
  late final GeneratedColumn<String?> titre = GeneratedColumn<String?>(
      'titre', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _debutMeta = const VerificationMeta('debut');
  @override
  late final GeneratedColumn<DateTime?> debut = GeneratedColumn<DateTime?>(
      'debut', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _finMeta = const VerificationMeta('fin');
  @override
  late final GeneratedColumn<DateTime?> fin = GeneratedColumn<DateTime?>(
      'fin', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _lastupdateMeta = const VerificationMeta('lastupdate');
  @override
  late final GeneratedColumn<DateTime?> lastupdate = GeneratedColumn<DateTime?>(
      'lastupdate', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id_evenement, id_personne, titre, description, debut, fin, lastupdate];
  @override
  String get aliasedName => _alias ?? 'evenements';
  @override
  String get actualTableName => 'evenements';
  @override
  VerificationContext validateIntegrity(Insertable<Evenement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_evenement')) {
      context.handle(
          _id_evenementMeta,
          id_evenement.isAcceptableOrUnknown(
              data['id_evenement']!, _id_evenementMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    } else if (isInserting) {
      context.missing(_id_personneMeta);
    }
    if (data.containsKey('titre')) {
      context.handle(
          _titreMeta, titre.isAcceptableOrUnknown(data['titre']!, _titreMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('debut')) {
      context.handle(
          _debutMeta, debut.isAcceptableOrUnknown(data['debut']!, _debutMeta));
    } else if (isInserting) {
      context.missing(_debutMeta);
    }
    if (data.containsKey('fin')) {
      context.handle(
          _finMeta, fin.isAcceptableOrUnknown(data['fin']!, _finMeta));
    } else if (isInserting) {
      context.missing(_finMeta);
    }
    if (data.containsKey('lastupdate')) {
      context.handle(
          _lastupdateMeta,
          lastupdate.isAcceptableOrUnknown(
              data['lastupdate']!, _lastupdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_evenement};
  @override
  Evenement map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Evenement.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EvenementsTable createAlias(String alias) {
    return $EvenementsTable(attachedDatabase, alias);
  }
}

class Albumphoto extends DataClass implements Insertable<Albumphoto> {
  final int id_communication_photo;
  final String? photo_description;
  final String? lien_piece_jointe;
  final int position;
  final int id_evenement;
  Albumphoto(
      {required this.id_communication_photo,
      this.photo_description,
      this.lien_piece_jointe,
      required this.position,
      required this.id_evenement});
  factory Albumphoto.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Albumphoto(
      id_communication_photo: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_communication_photo'])!,
      photo_description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}photo_description']),
      lien_piece_jointe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lien_piece_jointe']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      id_evenement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_evenement'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_communication_photo'] = Variable<int>(id_communication_photo);
    if (!nullToAbsent || photo_description != null) {
      map['photo_description'] = Variable<String?>(photo_description);
    }
    if (!nullToAbsent || lien_piece_jointe != null) {
      map['lien_piece_jointe'] = Variable<String?>(lien_piece_jointe);
    }
    map['position'] = Variable<int>(position);
    map['id_evenement'] = Variable<int>(id_evenement);
    return map;
  }

  AlbumphotosCompanion toCompanion(bool nullToAbsent) {
    return AlbumphotosCompanion(
      id_communication_photo: Value(id_communication_photo),
      photo_description: photo_description == null && nullToAbsent
          ? const Value.absent()
          : Value(photo_description),
      lien_piece_jointe: lien_piece_jointe == null && nullToAbsent
          ? const Value.absent()
          : Value(lien_piece_jointe),
      position: Value(position),
      id_evenement: Value(id_evenement),
    );
  }

  factory Albumphoto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Albumphoto(
      id_communication_photo:
          serializer.fromJson<int>(json['id_communication_photo']),
      photo_description:
          serializer.fromJson<String?>(json['photo_description']),
      lien_piece_jointe:
          serializer.fromJson<String?>(json['lien_piece_jointe']),
      position: serializer.fromJson<int>(json['position']),
      id_evenement: serializer.fromJson<int>(json['id_evenement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_communication_photo': serializer.toJson<int>(id_communication_photo),
      'photo_description': serializer.toJson<String?>(photo_description),
      'lien_piece_jointe': serializer.toJson<String?>(lien_piece_jointe),
      'position': serializer.toJson<int>(position),
      'id_evenement': serializer.toJson<int>(id_evenement),
    };
  }

  Albumphoto copyWith(
          {int? id_communication_photo,
          String? photo_description,
          String? lien_piece_jointe,
          int? position,
          int? id_evenement}) =>
      Albumphoto(
        id_communication_photo:
            id_communication_photo ?? this.id_communication_photo,
        photo_description: photo_description ?? this.photo_description,
        lien_piece_jointe: lien_piece_jointe ?? this.lien_piece_jointe,
        position: position ?? this.position,
        id_evenement: id_evenement ?? this.id_evenement,
      );
  @override
  String toString() {
    return (StringBuffer('Albumphoto(')
          ..write('id_communication_photo: $id_communication_photo, ')
          ..write('photo_description: $photo_description, ')
          ..write('lien_piece_jointe: $lien_piece_jointe, ')
          ..write('position: $position, ')
          ..write('id_evenement: $id_evenement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_communication_photo, photo_description,
      lien_piece_jointe, position, id_evenement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Albumphoto &&
          other.id_communication_photo == this.id_communication_photo &&
          other.photo_description == this.photo_description &&
          other.lien_piece_jointe == this.lien_piece_jointe &&
          other.position == this.position &&
          other.id_evenement == this.id_evenement);
}

class AlbumphotosCompanion extends UpdateCompanion<Albumphoto> {
  final Value<int> id_communication_photo;
  final Value<String?> photo_description;
  final Value<String?> lien_piece_jointe;
  final Value<int> position;
  final Value<int> id_evenement;
  const AlbumphotosCompanion({
    this.id_communication_photo = const Value.absent(),
    this.photo_description = const Value.absent(),
    this.lien_piece_jointe = const Value.absent(),
    this.position = const Value.absent(),
    this.id_evenement = const Value.absent(),
  });
  AlbumphotosCompanion.insert({
    this.id_communication_photo = const Value.absent(),
    this.photo_description = const Value.absent(),
    this.lien_piece_jointe = const Value.absent(),
    required int position,
    required int id_evenement,
  })  : position = Value(position),
        id_evenement = Value(id_evenement);
  static Insertable<Albumphoto> custom({
    Expression<int>? id_communication_photo,
    Expression<String?>? photo_description,
    Expression<String?>? lien_piece_jointe,
    Expression<int>? position,
    Expression<int>? id_evenement,
  }) {
    return RawValuesInsertable({
      if (id_communication_photo != null)
        'id_communication_photo': id_communication_photo,
      if (photo_description != null) 'photo_description': photo_description,
      if (lien_piece_jointe != null) 'lien_piece_jointe': lien_piece_jointe,
      if (position != null) 'position': position,
      if (id_evenement != null) 'id_evenement': id_evenement,
    });
  }

  AlbumphotosCompanion copyWith(
      {Value<int>? id_communication_photo,
      Value<String?>? photo_description,
      Value<String?>? lien_piece_jointe,
      Value<int>? position,
      Value<int>? id_evenement}) {
    return AlbumphotosCompanion(
      id_communication_photo:
          id_communication_photo ?? this.id_communication_photo,
      photo_description: photo_description ?? this.photo_description,
      lien_piece_jointe: lien_piece_jointe ?? this.lien_piece_jointe,
      position: position ?? this.position,
      id_evenement: id_evenement ?? this.id_evenement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_communication_photo.present) {
      map['id_communication_photo'] =
          Variable<int>(id_communication_photo.value);
    }
    if (photo_description.present) {
      map['photo_description'] = Variable<String?>(photo_description.value);
    }
    if (lien_piece_jointe.present) {
      map['lien_piece_jointe'] = Variable<String?>(lien_piece_jointe.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (id_evenement.present) {
      map['id_evenement'] = Variable<int>(id_evenement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumphotosCompanion(')
          ..write('id_communication_photo: $id_communication_photo, ')
          ..write('photo_description: $photo_description, ')
          ..write('lien_piece_jointe: $lien_piece_jointe, ')
          ..write('position: $position, ')
          ..write('id_evenement: $id_evenement')
          ..write(')'))
        .toString();
  }
}

class $AlbumphotosTable extends Albumphotos
    with TableInfo<$AlbumphotosTable, Albumphoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlbumphotosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_communication_photoMeta =
      const VerificationMeta('id_communication_photo');
  @override
  late final GeneratedColumn<int?> id_communication_photo =
      GeneratedColumn<int?>('id_communication_photo', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _photo_descriptionMeta =
      const VerificationMeta('photo_description');
  @override
  late final GeneratedColumn<String?> photo_description =
      GeneratedColumn<String?>('photo_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lien_piece_jointeMeta =
      const VerificationMeta('lien_piece_jointe');
  @override
  late final GeneratedColumn<String?> lien_piece_jointe =
      GeneratedColumn<String?>('lien_piece_jointe', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _id_evenementMeta =
      const VerificationMeta('id_evenement');
  @override
  late final GeneratedColumn<int?> id_evenement = GeneratedColumn<int?>(
      'id_evenement', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id_communication_photo,
        photo_description,
        lien_piece_jointe,
        position,
        id_evenement
      ];
  @override
  String get aliasedName => _alias ?? 'albumphotos';
  @override
  String get actualTableName => 'albumphotos';
  @override
  VerificationContext validateIntegrity(Insertable<Albumphoto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_communication_photo')) {
      context.handle(
          _id_communication_photoMeta,
          id_communication_photo.isAcceptableOrUnknown(
              data['id_communication_photo']!, _id_communication_photoMeta));
    }
    if (data.containsKey('photo_description')) {
      context.handle(
          _photo_descriptionMeta,
          photo_description.isAcceptableOrUnknown(
              data['photo_description']!, _photo_descriptionMeta));
    }
    if (data.containsKey('lien_piece_jointe')) {
      context.handle(
          _lien_piece_jointeMeta,
          lien_piece_jointe.isAcceptableOrUnknown(
              data['lien_piece_jointe']!, _lien_piece_jointeMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('id_evenement')) {
      context.handle(
          _id_evenementMeta,
          id_evenement.isAcceptableOrUnknown(
              data['id_evenement']!, _id_evenementMeta));
    } else if (isInserting) {
      context.missing(_id_evenementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_communication_photo};
  @override
  Albumphoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Albumphoto.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AlbumphotosTable createAlias(String alias) {
    return $AlbumphotosTable(attachedDatabase, alias);
  }
}

class Piecesjointe extends DataClass implements Insertable<Piecesjointe> {
  final int id_communication_piece_jointe;
  final String? lien_piece_jointe;
  final int? id_evenement;
  final int? id_information;
  Piecesjointe(
      {required this.id_communication_piece_jointe,
      this.lien_piece_jointe,
      this.id_evenement,
      this.id_information});
  factory Piecesjointe.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Piecesjointe(
      id_communication_piece_jointe: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_communication_piece_jointe'])!,
      lien_piece_jointe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lien_piece_jointe']),
      id_evenement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_evenement']),
      id_information: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_information']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_communication_piece_jointe'] =
        Variable<int>(id_communication_piece_jointe);
    if (!nullToAbsent || lien_piece_jointe != null) {
      map['lien_piece_jointe'] = Variable<String?>(lien_piece_jointe);
    }
    if (!nullToAbsent || id_evenement != null) {
      map['id_evenement'] = Variable<int?>(id_evenement);
    }
    if (!nullToAbsent || id_information != null) {
      map['id_information'] = Variable<int?>(id_information);
    }
    return map;
  }

  PiecesjointesCompanion toCompanion(bool nullToAbsent) {
    return PiecesjointesCompanion(
      id_communication_piece_jointe: Value(id_communication_piece_jointe),
      lien_piece_jointe: lien_piece_jointe == null && nullToAbsent
          ? const Value.absent()
          : Value(lien_piece_jointe),
      id_evenement: id_evenement == null && nullToAbsent
          ? const Value.absent()
          : Value(id_evenement),
      id_information: id_information == null && nullToAbsent
          ? const Value.absent()
          : Value(id_information),
    );
  }

  factory Piecesjointe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Piecesjointe(
      id_communication_piece_jointe:
          serializer.fromJson<int>(json['id_communication_piece_jointe']),
      lien_piece_jointe:
          serializer.fromJson<String?>(json['lien_piece_jointe']),
      id_evenement: serializer.fromJson<int?>(json['id_evenement']),
      id_information: serializer.fromJson<int?>(json['id_information']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_communication_piece_jointe':
          serializer.toJson<int>(id_communication_piece_jointe),
      'lien_piece_jointe': serializer.toJson<String?>(lien_piece_jointe),
      'id_evenement': serializer.toJson<int?>(id_evenement),
      'id_information': serializer.toJson<int?>(id_information),
    };
  }

  Piecesjointe copyWith(
          {int? id_communication_piece_jointe,
          String? lien_piece_jointe,
          int? id_evenement,
          int? id_information}) =>
      Piecesjointe(
        id_communication_piece_jointe:
            id_communication_piece_jointe ?? this.id_communication_piece_jointe,
        lien_piece_jointe: lien_piece_jointe ?? this.lien_piece_jointe,
        id_evenement: id_evenement ?? this.id_evenement,
        id_information: id_information ?? this.id_information,
      );
  @override
  String toString() {
    return (StringBuffer('Piecesjointe(')
          ..write(
              'id_communication_piece_jointe: $id_communication_piece_jointe, ')
          ..write('lien_piece_jointe: $lien_piece_jointe, ')
          ..write('id_evenement: $id_evenement, ')
          ..write('id_information: $id_information')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_communication_piece_jointe,
      lien_piece_jointe, id_evenement, id_information);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Piecesjointe &&
          other.id_communication_piece_jointe ==
              this.id_communication_piece_jointe &&
          other.lien_piece_jointe == this.lien_piece_jointe &&
          other.id_evenement == this.id_evenement &&
          other.id_information == this.id_information);
}

class PiecesjointesCompanion extends UpdateCompanion<Piecesjointe> {
  final Value<int> id_communication_piece_jointe;
  final Value<String?> lien_piece_jointe;
  final Value<int?> id_evenement;
  final Value<int?> id_information;
  const PiecesjointesCompanion({
    this.id_communication_piece_jointe = const Value.absent(),
    this.lien_piece_jointe = const Value.absent(),
    this.id_evenement = const Value.absent(),
    this.id_information = const Value.absent(),
  });
  PiecesjointesCompanion.insert({
    this.id_communication_piece_jointe = const Value.absent(),
    this.lien_piece_jointe = const Value.absent(),
    this.id_evenement = const Value.absent(),
    this.id_information = const Value.absent(),
  });
  static Insertable<Piecesjointe> custom({
    Expression<int>? id_communication_piece_jointe,
    Expression<String?>? lien_piece_jointe,
    Expression<int?>? id_evenement,
    Expression<int?>? id_information,
  }) {
    return RawValuesInsertable({
      if (id_communication_piece_jointe != null)
        'id_communication_piece_jointe': id_communication_piece_jointe,
      if (lien_piece_jointe != null) 'lien_piece_jointe': lien_piece_jointe,
      if (id_evenement != null) 'id_evenement': id_evenement,
      if (id_information != null) 'id_information': id_information,
    });
  }

  PiecesjointesCompanion copyWith(
      {Value<int>? id_communication_piece_jointe,
      Value<String?>? lien_piece_jointe,
      Value<int?>? id_evenement,
      Value<int?>? id_information}) {
    return PiecesjointesCompanion(
      id_communication_piece_jointe:
          id_communication_piece_jointe ?? this.id_communication_piece_jointe,
      lien_piece_jointe: lien_piece_jointe ?? this.lien_piece_jointe,
      id_evenement: id_evenement ?? this.id_evenement,
      id_information: id_information ?? this.id_information,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_communication_piece_jointe.present) {
      map['id_communication_piece_jointe'] =
          Variable<int>(id_communication_piece_jointe.value);
    }
    if (lien_piece_jointe.present) {
      map['lien_piece_jointe'] = Variable<String?>(lien_piece_jointe.value);
    }
    if (id_evenement.present) {
      map['id_evenement'] = Variable<int?>(id_evenement.value);
    }
    if (id_information.present) {
      map['id_information'] = Variable<int?>(id_information.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PiecesjointesCompanion(')
          ..write(
              'id_communication_piece_jointe: $id_communication_piece_jointe, ')
          ..write('lien_piece_jointe: $lien_piece_jointe, ')
          ..write('id_evenement: $id_evenement, ')
          ..write('id_information: $id_information')
          ..write(')'))
        .toString();
  }
}

class $PiecesjointesTable extends Piecesjointes
    with TableInfo<$PiecesjointesTable, Piecesjointe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PiecesjointesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_communication_piece_jointeMeta =
      const VerificationMeta('id_communication_piece_jointe');
  @override
  late final GeneratedColumn<int?> id_communication_piece_jointe =
      GeneratedColumn<int?>('id_communication_piece_jointe', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _lien_piece_jointeMeta =
      const VerificationMeta('lien_piece_jointe');
  @override
  late final GeneratedColumn<String?> lien_piece_jointe =
      GeneratedColumn<String?>('lien_piece_jointe', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _id_evenementMeta =
      const VerificationMeta('id_evenement');
  @override
  late final GeneratedColumn<int?> id_evenement = GeneratedColumn<int?>(
      'id_evenement', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_informationMeta =
      const VerificationMeta('id_information');
  @override
  late final GeneratedColumn<int?> id_information = GeneratedColumn<int?>(
      'id_information', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_communication_piece_jointe,
        lien_piece_jointe,
        id_evenement,
        id_information
      ];
  @override
  String get aliasedName => _alias ?? 'piecesjointes';
  @override
  String get actualTableName => 'piecesjointes';
  @override
  VerificationContext validateIntegrity(Insertable<Piecesjointe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_communication_piece_jointe')) {
      context.handle(
          _id_communication_piece_jointeMeta,
          id_communication_piece_jointe.isAcceptableOrUnknown(
              data['id_communication_piece_jointe']!,
              _id_communication_piece_jointeMeta));
    }
    if (data.containsKey('lien_piece_jointe')) {
      context.handle(
          _lien_piece_jointeMeta,
          lien_piece_jointe.isAcceptableOrUnknown(
              data['lien_piece_jointe']!, _lien_piece_jointeMeta));
    }
    if (data.containsKey('id_evenement')) {
      context.handle(
          _id_evenementMeta,
          id_evenement.isAcceptableOrUnknown(
              data['id_evenement']!, _id_evenementMeta));
    }
    if (data.containsKey('id_information')) {
      context.handle(
          _id_informationMeta,
          id_information.isAcceptableOrUnknown(
              data['id_information']!, _id_informationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_communication_piece_jointe};
  @override
  Piecesjointe map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Piecesjointe.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PiecesjointesTable createAlias(String alias) {
    return $PiecesjointesTable(attachedDatabase, alias);
  }
}

class Information extends DataClass implements Insertable<Information> {
  final int id_information;
  final int id_personne;
  final String? titre;
  final String? description;
  final DateTime debut;
  final DateTime fin;
  final String lastupdate;
  Information(
      {required this.id_information,
      required this.id_personne,
      this.titre,
      this.description,
      required this.debut,
      required this.fin,
      required this.lastupdate});
  factory Information.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Information(
      id_information: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_information'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      titre: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}titre']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      debut: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}debut'])!,
      fin: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fin'])!,
      lastupdate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lastupdate'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_information'] = Variable<int>(id_information);
    map['id_personne'] = Variable<int>(id_personne);
    if (!nullToAbsent || titre != null) {
      map['titre'] = Variable<String?>(titre);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['debut'] = Variable<DateTime>(debut);
    map['fin'] = Variable<DateTime>(fin);
    map['lastupdate'] = Variable<String>(lastupdate);
    return map;
  }

  InformationsCompanion toCompanion(bool nullToAbsent) {
    return InformationsCompanion(
      id_information: Value(id_information),
      id_personne: Value(id_personne),
      titre:
          titre == null && nullToAbsent ? const Value.absent() : Value(titre),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      debut: Value(debut),
      fin: Value(fin),
      lastupdate: Value(lastupdate),
    );
  }

  factory Information.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Information(
      id_information: serializer.fromJson<int>(json['id_information']),
      id_personne: serializer.fromJson<int>(json['id_personne']),
      titre: serializer.fromJson<String?>(json['titre']),
      description: serializer.fromJson<String?>(json['description']),
      debut: serializer.fromJson<DateTime>(json['debut']),
      fin: serializer.fromJson<DateTime>(json['fin']),
      lastupdate: serializer.fromJson<String>(json['lastupdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_information': serializer.toJson<int>(id_information),
      'id_personne': serializer.toJson<int>(id_personne),
      'titre': serializer.toJson<String?>(titre),
      'description': serializer.toJson<String?>(description),
      'debut': serializer.toJson<DateTime>(debut),
      'fin': serializer.toJson<DateTime>(fin),
      'lastupdate': serializer.toJson<String>(lastupdate),
    };
  }

  Information copyWith(
          {int? id_information,
          int? id_personne,
          String? titre,
          String? description,
          DateTime? debut,
          DateTime? fin,
          String? lastupdate}) =>
      Information(
        id_information: id_information ?? this.id_information,
        id_personne: id_personne ?? this.id_personne,
        titre: titre ?? this.titre,
        description: description ?? this.description,
        debut: debut ?? this.debut,
        fin: fin ?? this.fin,
        lastupdate: lastupdate ?? this.lastupdate,
      );
  @override
  String toString() {
    return (StringBuffer('Information(')
          ..write('id_information: $id_information, ')
          ..write('id_personne: $id_personne, ')
          ..write('titre: $titre, ')
          ..write('description: $description, ')
          ..write('debut: $debut, ')
          ..write('fin: $fin, ')
          ..write('lastupdate: $lastupdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_information, id_personne, titre, description, debut, fin, lastupdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Information &&
          other.id_information == this.id_information &&
          other.id_personne == this.id_personne &&
          other.titre == this.titre &&
          other.description == this.description &&
          other.debut == this.debut &&
          other.fin == this.fin &&
          other.lastupdate == this.lastupdate);
}

class InformationsCompanion extends UpdateCompanion<Information> {
  final Value<int> id_information;
  final Value<int> id_personne;
  final Value<String?> titre;
  final Value<String?> description;
  final Value<DateTime> debut;
  final Value<DateTime> fin;
  final Value<String> lastupdate;
  const InformationsCompanion({
    this.id_information = const Value.absent(),
    this.id_personne = const Value.absent(),
    this.titre = const Value.absent(),
    this.description = const Value.absent(),
    this.debut = const Value.absent(),
    this.fin = const Value.absent(),
    this.lastupdate = const Value.absent(),
  });
  InformationsCompanion.insert({
    this.id_information = const Value.absent(),
    required int id_personne,
    this.titre = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime debut,
    required DateTime fin,
    required String lastupdate,
  })  : id_personne = Value(id_personne),
        debut = Value(debut),
        fin = Value(fin),
        lastupdate = Value(lastupdate);
  static Insertable<Information> custom({
    Expression<int>? id_information,
    Expression<int>? id_personne,
    Expression<String?>? titre,
    Expression<String?>? description,
    Expression<DateTime>? debut,
    Expression<DateTime>? fin,
    Expression<String>? lastupdate,
  }) {
    return RawValuesInsertable({
      if (id_information != null) 'id_information': id_information,
      if (id_personne != null) 'id_personne': id_personne,
      if (titre != null) 'titre': titre,
      if (description != null) 'description': description,
      if (debut != null) 'debut': debut,
      if (fin != null) 'fin': fin,
      if (lastupdate != null) 'lastupdate': lastupdate,
    });
  }

  InformationsCompanion copyWith(
      {Value<int>? id_information,
      Value<int>? id_personne,
      Value<String?>? titre,
      Value<String?>? description,
      Value<DateTime>? debut,
      Value<DateTime>? fin,
      Value<String>? lastupdate}) {
    return InformationsCompanion(
      id_information: id_information ?? this.id_information,
      id_personne: id_personne ?? this.id_personne,
      titre: titre ?? this.titre,
      description: description ?? this.description,
      debut: debut ?? this.debut,
      fin: fin ?? this.fin,
      lastupdate: lastupdate ?? this.lastupdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_information.present) {
      map['id_information'] = Variable<int>(id_information.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (titre.present) {
      map['titre'] = Variable<String?>(titre.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (debut.present) {
      map['debut'] = Variable<DateTime>(debut.value);
    }
    if (fin.present) {
      map['fin'] = Variable<DateTime>(fin.value);
    }
    if (lastupdate.present) {
      map['lastupdate'] = Variable<String>(lastupdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InformationsCompanion(')
          ..write('id_information: $id_information, ')
          ..write('id_personne: $id_personne, ')
          ..write('titre: $titre, ')
          ..write('description: $description, ')
          ..write('debut: $debut, ')
          ..write('fin: $fin, ')
          ..write('lastupdate: $lastupdate')
          ..write(')'))
        .toString();
  }
}

class $InformationsTable extends Informations
    with TableInfo<$InformationsTable, Information> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InformationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_informationMeta =
      const VerificationMeta('id_information');
  @override
  late final GeneratedColumn<int?> id_information = GeneratedColumn<int?>(
      'id_information', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titreMeta = const VerificationMeta('titre');
  @override
  late final GeneratedColumn<String?> titre = GeneratedColumn<String?>(
      'titre', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _debutMeta = const VerificationMeta('debut');
  @override
  late final GeneratedColumn<DateTime?> debut = GeneratedColumn<DateTime?>(
      'debut', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _finMeta = const VerificationMeta('fin');
  @override
  late final GeneratedColumn<DateTime?> fin = GeneratedColumn<DateTime?>(
      'fin', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _lastupdateMeta = const VerificationMeta('lastupdate');
  @override
  late final GeneratedColumn<String?> lastupdate = GeneratedColumn<String?>(
      'lastupdate', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id_information, id_personne, titre, description, debut, fin, lastupdate];
  @override
  String get aliasedName => _alias ?? 'informations';
  @override
  String get actualTableName => 'informations';
  @override
  VerificationContext validateIntegrity(Insertable<Information> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_information')) {
      context.handle(
          _id_informationMeta,
          id_information.isAcceptableOrUnknown(
              data['id_information']!, _id_informationMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    } else if (isInserting) {
      context.missing(_id_personneMeta);
    }
    if (data.containsKey('titre')) {
      context.handle(
          _titreMeta, titre.isAcceptableOrUnknown(data['titre']!, _titreMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('debut')) {
      context.handle(
          _debutMeta, debut.isAcceptableOrUnknown(data['debut']!, _debutMeta));
    } else if (isInserting) {
      context.missing(_debutMeta);
    }
    if (data.containsKey('fin')) {
      context.handle(
          _finMeta, fin.isAcceptableOrUnknown(data['fin']!, _finMeta));
    } else if (isInserting) {
      context.missing(_finMeta);
    }
    if (data.containsKey('lastupdate')) {
      context.handle(
          _lastupdateMeta,
          lastupdate.isAcceptableOrUnknown(
              data['lastupdate']!, _lastupdateMeta));
    } else if (isInserting) {
      context.missing(_lastupdateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_information};
  @override
  Information map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Information.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InformationsTable createAlias(String alias) {
    return $InformationsTable(attachedDatabase, alias);
  }
}

class AgendaType extends DataClass implements Insertable<AgendaType> {
  final int id_agenda_type;
  final String? description;
  final String? lien_image;
  final String? agenda_journee_type_description;
  final int? id_agenda_types_prestation;
  AgendaType(
      {required this.id_agenda_type,
      this.description,
      this.lien_image,
      this.agenda_journee_type_description,
      this.id_agenda_types_prestation});
  factory AgendaType.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AgendaType(
      id_agenda_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda_type'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      lien_image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lien_image']),
      agenda_journee_type_description: const StringType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}agenda_journee_type_description']),
      id_agenda_types_prestation: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_agenda_types_prestation']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda_type'] = Variable<int>(id_agenda_type);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || lien_image != null) {
      map['lien_image'] = Variable<String?>(lien_image);
    }
    if (!nullToAbsent || agenda_journee_type_description != null) {
      map['agenda_journee_type_description'] =
          Variable<String?>(agenda_journee_type_description);
    }
    if (!nullToAbsent || id_agenda_types_prestation != null) {
      map['id_agenda_types_prestation'] =
          Variable<int?>(id_agenda_types_prestation);
    }
    return map;
  }

  AgendaTypesCompanion toCompanion(bool nullToAbsent) {
    return AgendaTypesCompanion(
      id_agenda_type: Value(id_agenda_type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      lien_image: lien_image == null && nullToAbsent
          ? const Value.absent()
          : Value(lien_image),
      agenda_journee_type_description:
          agenda_journee_type_description == null && nullToAbsent
              ? const Value.absent()
              : Value(agenda_journee_type_description),
      id_agenda_types_prestation:
          id_agenda_types_prestation == null && nullToAbsent
              ? const Value.absent()
              : Value(id_agenda_types_prestation),
    );
  }

  factory AgendaType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AgendaType(
      id_agenda_type: serializer.fromJson<int>(json['id_agenda_type']),
      description: serializer.fromJson<String?>(json['description']),
      lien_image: serializer.fromJson<String?>(json['lien_image']),
      agenda_journee_type_description:
          serializer.fromJson<String?>(json['agenda_journee_type_description']),
      id_agenda_types_prestation:
          serializer.fromJson<int?>(json['id_agenda_types_prestation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda_type': serializer.toJson<int>(id_agenda_type),
      'description': serializer.toJson<String?>(description),
      'lien_image': serializer.toJson<String?>(lien_image),
      'agenda_journee_type_description':
          serializer.toJson<String?>(agenda_journee_type_description),
      'id_agenda_types_prestation':
          serializer.toJson<int?>(id_agenda_types_prestation),
    };
  }

  AgendaType copyWith(
          {int? id_agenda_type,
          String? description,
          String? lien_image,
          String? agenda_journee_type_description,
          int? id_agenda_types_prestation}) =>
      AgendaType(
        id_agenda_type: id_agenda_type ?? this.id_agenda_type,
        description: description ?? this.description,
        lien_image: lien_image ?? this.lien_image,
        agenda_journee_type_description: agenda_journee_type_description ??
            this.agenda_journee_type_description,
        id_agenda_types_prestation:
            id_agenda_types_prestation ?? this.id_agenda_types_prestation,
      );
  @override
  String toString() {
    return (StringBuffer('AgendaType(')
          ..write('id_agenda_type: $id_agenda_type, ')
          ..write('description: $description, ')
          ..write('lien_image: $lien_image, ')
          ..write(
              'agenda_journee_type_description: $agenda_journee_type_description, ')
          ..write('id_agenda_types_prestation: $id_agenda_types_prestation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_agenda_type, description, lien_image,
      agenda_journee_type_description, id_agenda_types_prestation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgendaType &&
          other.id_agenda_type == this.id_agenda_type &&
          other.description == this.description &&
          other.lien_image == this.lien_image &&
          other.agenda_journee_type_description ==
              this.agenda_journee_type_description &&
          other.id_agenda_types_prestation == this.id_agenda_types_prestation);
}

class AgendaTypesCompanion extends UpdateCompanion<AgendaType> {
  final Value<int> id_agenda_type;
  final Value<String?> description;
  final Value<String?> lien_image;
  final Value<String?> agenda_journee_type_description;
  final Value<int?> id_agenda_types_prestation;
  const AgendaTypesCompanion({
    this.id_agenda_type = const Value.absent(),
    this.description = const Value.absent(),
    this.lien_image = const Value.absent(),
    this.agenda_journee_type_description = const Value.absent(),
    this.id_agenda_types_prestation = const Value.absent(),
  });
  AgendaTypesCompanion.insert({
    this.id_agenda_type = const Value.absent(),
    this.description = const Value.absent(),
    this.lien_image = const Value.absent(),
    this.agenda_journee_type_description = const Value.absent(),
    this.id_agenda_types_prestation = const Value.absent(),
  });
  static Insertable<AgendaType> custom({
    Expression<int>? id_agenda_type,
    Expression<String?>? description,
    Expression<String?>? lien_image,
    Expression<String?>? agenda_journee_type_description,
    Expression<int?>? id_agenda_types_prestation,
  }) {
    return RawValuesInsertable({
      if (id_agenda_type != null) 'id_agenda_type': id_agenda_type,
      if (description != null) 'description': description,
      if (lien_image != null) 'lien_image': lien_image,
      if (agenda_journee_type_description != null)
        'agenda_journee_type_description': agenda_journee_type_description,
      if (id_agenda_types_prestation != null)
        'id_agenda_types_prestation': id_agenda_types_prestation,
    });
  }

  AgendaTypesCompanion copyWith(
      {Value<int>? id_agenda_type,
      Value<String?>? description,
      Value<String?>? lien_image,
      Value<String?>? agenda_journee_type_description,
      Value<int?>? id_agenda_types_prestation}) {
    return AgendaTypesCompanion(
      id_agenda_type: id_agenda_type ?? this.id_agenda_type,
      description: description ?? this.description,
      lien_image: lien_image ?? this.lien_image,
      agenda_journee_type_description: agenda_journee_type_description ??
          this.agenda_journee_type_description,
      id_agenda_types_prestation:
          id_agenda_types_prestation ?? this.id_agenda_types_prestation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda_type.present) {
      map['id_agenda_type'] = Variable<int>(id_agenda_type.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (lien_image.present) {
      map['lien_image'] = Variable<String?>(lien_image.value);
    }
    if (agenda_journee_type_description.present) {
      map['agenda_journee_type_description'] =
          Variable<String?>(agenda_journee_type_description.value);
    }
    if (id_agenda_types_prestation.present) {
      map['id_agenda_types_prestation'] =
          Variable<int?>(id_agenda_types_prestation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendaTypesCompanion(')
          ..write('id_agenda_type: $id_agenda_type, ')
          ..write('description: $description, ')
          ..write('lien_image: $lien_image, ')
          ..write(
              'agenda_journee_type_description: $agenda_journee_type_description, ')
          ..write('id_agenda_types_prestation: $id_agenda_types_prestation')
          ..write(')'))
        .toString();
  }
}

class $AgendaTypesTable extends AgendaTypes
    with TableInfo<$AgendaTypesTable, AgendaType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendaTypesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agenda_typeMeta =
      const VerificationMeta('id_agenda_type');
  @override
  late final GeneratedColumn<int?> id_agenda_type = GeneratedColumn<int?>(
      'id_agenda_type', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lien_imageMeta = const VerificationMeta('lien_image');
  @override
  late final GeneratedColumn<String?> lien_image = GeneratedColumn<String?>(
      'lien_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _agenda_journee_type_descriptionMeta =
      const VerificationMeta('agenda_journee_type_description');
  @override
  late final GeneratedColumn<String?> agenda_journee_type_description =
      GeneratedColumn<String?>(
          'agenda_journee_type_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _id_agenda_types_prestationMeta =
      const VerificationMeta('id_agenda_types_prestation');
  @override
  late final GeneratedColumn<int?> id_agenda_types_prestation =
      GeneratedColumn<int?>('id_agenda_types_prestation', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_agenda_type,
        description,
        lien_image,
        agenda_journee_type_description,
        id_agenda_types_prestation
      ];
  @override
  String get aliasedName => _alias ?? 'agenda_types';
  @override
  String get actualTableName => 'agenda_types';
  @override
  VerificationContext validateIntegrity(Insertable<AgendaType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda_type')) {
      context.handle(
          _id_agenda_typeMeta,
          id_agenda_type.isAcceptableOrUnknown(
              data['id_agenda_type']!, _id_agenda_typeMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('lien_image')) {
      context.handle(
          _lien_imageMeta,
          lien_image.isAcceptableOrUnknown(
              data['lien_image']!, _lien_imageMeta));
    }
    if (data.containsKey('agenda_journee_type_description')) {
      context.handle(
          _agenda_journee_type_descriptionMeta,
          agenda_journee_type_description.isAcceptableOrUnknown(
              data['agenda_journee_type_description']!,
              _agenda_journee_type_descriptionMeta));
    }
    if (data.containsKey('id_agenda_types_prestation')) {
      context.handle(
          _id_agenda_types_prestationMeta,
          id_agenda_types_prestation.isAcceptableOrUnknown(
              data['id_agenda_types_prestation']!,
              _id_agenda_types_prestationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_type};
  @override
  AgendaType map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AgendaType.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendaTypesTable createAlias(String alias) {
    return $AgendaTypesTable(attachedDatabase, alias);
  }
}

class AgendaTypesDetail extends DataClass
    implements Insertable<AgendaTypesDetail> {
  final int id_agenda_type_detail;
  final String? description;
  final String? lien_image;
  final int? position;
  final int? facturable;
  final int id_agenda_type;
  AgendaTypesDetail(
      {required this.id_agenda_type_detail,
      this.description,
      this.lien_image,
      this.position,
      this.facturable,
      required this.id_agenda_type});
  factory AgendaTypesDetail.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AgendaTypesDetail(
      id_agenda_type_detail: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_agenda_type_detail'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      lien_image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lien_image']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position']),
      facturable: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}facturable']),
      id_agenda_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda_type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda_type_detail'] = Variable<int>(id_agenda_type_detail);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || lien_image != null) {
      map['lien_image'] = Variable<String?>(lien_image);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int?>(position);
    }
    if (!nullToAbsent || facturable != null) {
      map['facturable'] = Variable<int?>(facturable);
    }
    map['id_agenda_type'] = Variable<int>(id_agenda_type);
    return map;
  }

  AgendaTypesDetailsCompanion toCompanion(bool nullToAbsent) {
    return AgendaTypesDetailsCompanion(
      id_agenda_type_detail: Value(id_agenda_type_detail),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      lien_image: lien_image == null && nullToAbsent
          ? const Value.absent()
          : Value(lien_image),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      facturable: facturable == null && nullToAbsent
          ? const Value.absent()
          : Value(facturable),
      id_agenda_type: Value(id_agenda_type),
    );
  }

  factory AgendaTypesDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AgendaTypesDetail(
      id_agenda_type_detail:
          serializer.fromJson<int>(json['id_agenda_type_detail']),
      description: serializer.fromJson<String?>(json['description']),
      lien_image: serializer.fromJson<String?>(json['lien_image']),
      position: serializer.fromJson<int?>(json['position']),
      facturable: serializer.fromJson<int?>(json['facturable']),
      id_agenda_type: serializer.fromJson<int>(json['id_agenda_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda_type_detail': serializer.toJson<int>(id_agenda_type_detail),
      'description': serializer.toJson<String?>(description),
      'lien_image': serializer.toJson<String?>(lien_image),
      'position': serializer.toJson<int?>(position),
      'facturable': serializer.toJson<int?>(facturable),
      'id_agenda_type': serializer.toJson<int>(id_agenda_type),
    };
  }

  AgendaTypesDetail copyWith(
          {int? id_agenda_type_detail,
          String? description,
          String? lien_image,
          int? position,
          int? facturable,
          int? id_agenda_type}) =>
      AgendaTypesDetail(
        id_agenda_type_detail:
            id_agenda_type_detail ?? this.id_agenda_type_detail,
        description: description ?? this.description,
        lien_image: lien_image ?? this.lien_image,
        position: position ?? this.position,
        facturable: facturable ?? this.facturable,
        id_agenda_type: id_agenda_type ?? this.id_agenda_type,
      );
  @override
  String toString() {
    return (StringBuffer('AgendaTypesDetail(')
          ..write('id_agenda_type_detail: $id_agenda_type_detail, ')
          ..write('description: $description, ')
          ..write('lien_image: $lien_image, ')
          ..write('position: $position, ')
          ..write('facturable: $facturable, ')
          ..write('id_agenda_type: $id_agenda_type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_agenda_type_detail, description,
      lien_image, position, facturable, id_agenda_type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgendaTypesDetail &&
          other.id_agenda_type_detail == this.id_agenda_type_detail &&
          other.description == this.description &&
          other.lien_image == this.lien_image &&
          other.position == this.position &&
          other.facturable == this.facturable &&
          other.id_agenda_type == this.id_agenda_type);
}

class AgendaTypesDetailsCompanion extends UpdateCompanion<AgendaTypesDetail> {
  final Value<int> id_agenda_type_detail;
  final Value<String?> description;
  final Value<String?> lien_image;
  final Value<int?> position;
  final Value<int?> facturable;
  final Value<int> id_agenda_type;
  const AgendaTypesDetailsCompanion({
    this.id_agenda_type_detail = const Value.absent(),
    this.description = const Value.absent(),
    this.lien_image = const Value.absent(),
    this.position = const Value.absent(),
    this.facturable = const Value.absent(),
    this.id_agenda_type = const Value.absent(),
  });
  AgendaTypesDetailsCompanion.insert({
    this.id_agenda_type_detail = const Value.absent(),
    this.description = const Value.absent(),
    this.lien_image = const Value.absent(),
    this.position = const Value.absent(),
    this.facturable = const Value.absent(),
    required int id_agenda_type,
  }) : id_agenda_type = Value(id_agenda_type);
  static Insertable<AgendaTypesDetail> custom({
    Expression<int>? id_agenda_type_detail,
    Expression<String?>? description,
    Expression<String?>? lien_image,
    Expression<int?>? position,
    Expression<int?>? facturable,
    Expression<int>? id_agenda_type,
  }) {
    return RawValuesInsertable({
      if (id_agenda_type_detail != null)
        'id_agenda_type_detail': id_agenda_type_detail,
      if (description != null) 'description': description,
      if (lien_image != null) 'lien_image': lien_image,
      if (position != null) 'position': position,
      if (facturable != null) 'facturable': facturable,
      if (id_agenda_type != null) 'id_agenda_type': id_agenda_type,
    });
  }

  AgendaTypesDetailsCompanion copyWith(
      {Value<int>? id_agenda_type_detail,
      Value<String?>? description,
      Value<String?>? lien_image,
      Value<int?>? position,
      Value<int?>? facturable,
      Value<int>? id_agenda_type}) {
    return AgendaTypesDetailsCompanion(
      id_agenda_type_detail:
          id_agenda_type_detail ?? this.id_agenda_type_detail,
      description: description ?? this.description,
      lien_image: lien_image ?? this.lien_image,
      position: position ?? this.position,
      facturable: facturable ?? this.facturable,
      id_agenda_type: id_agenda_type ?? this.id_agenda_type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda_type_detail.present) {
      map['id_agenda_type_detail'] = Variable<int>(id_agenda_type_detail.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (lien_image.present) {
      map['lien_image'] = Variable<String?>(lien_image.value);
    }
    if (position.present) {
      map['position'] = Variable<int?>(position.value);
    }
    if (facturable.present) {
      map['facturable'] = Variable<int?>(facturable.value);
    }
    if (id_agenda_type.present) {
      map['id_agenda_type'] = Variable<int>(id_agenda_type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendaTypesDetailsCompanion(')
          ..write('id_agenda_type_detail: $id_agenda_type_detail, ')
          ..write('description: $description, ')
          ..write('lien_image: $lien_image, ')
          ..write('position: $position, ')
          ..write('facturable: $facturable, ')
          ..write('id_agenda_type: $id_agenda_type')
          ..write(')'))
        .toString();
  }
}

class $AgendaTypesDetailsTable extends AgendaTypesDetails
    with TableInfo<$AgendaTypesDetailsTable, AgendaTypesDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendaTypesDetailsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agenda_type_detailMeta =
      const VerificationMeta('id_agenda_type_detail');
  @override
  late final GeneratedColumn<int?> id_agenda_type_detail =
      GeneratedColumn<int?>('id_agenda_type_detail', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lien_imageMeta = const VerificationMeta('lien_image');
  @override
  late final GeneratedColumn<String?> lien_image = GeneratedColumn<String?>(
      'lien_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _facturableMeta = const VerificationMeta('facturable');
  @override
  late final GeneratedColumn<int?> facturable = GeneratedColumn<int?>(
      'facturable', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_agenda_typeMeta =
      const VerificationMeta('id_agenda_type');
  @override
  late final GeneratedColumn<int?> id_agenda_type = GeneratedColumn<int?>(
      'id_agenda_type', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id_agenda_type_detail,
        description,
        lien_image,
        position,
        facturable,
        id_agenda_type
      ];
  @override
  String get aliasedName => _alias ?? 'agenda_types_details';
  @override
  String get actualTableName => 'agenda_types_details';
  @override
  VerificationContext validateIntegrity(Insertable<AgendaTypesDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda_type_detail')) {
      context.handle(
          _id_agenda_type_detailMeta,
          id_agenda_type_detail.isAcceptableOrUnknown(
              data['id_agenda_type_detail']!, _id_agenda_type_detailMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('lien_image')) {
      context.handle(
          _lien_imageMeta,
          lien_image.isAcceptableOrUnknown(
              data['lien_image']!, _lien_imageMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('facturable')) {
      context.handle(
          _facturableMeta,
          facturable.isAcceptableOrUnknown(
              data['facturable']!, _facturableMeta));
    }
    if (data.containsKey('id_agenda_type')) {
      context.handle(
          _id_agenda_typeMeta,
          id_agenda_type.isAcceptableOrUnknown(
              data['id_agenda_type']!, _id_agenda_typeMeta));
    } else if (isInserting) {
      context.missing(_id_agenda_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_type_detail};
  @override
  AgendaTypesDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AgendaTypesDetail.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendaTypesDetailsTable createAlias(String alias) {
    return $AgendaTypesDetailsTable(attachedDatabase, alias);
  }
}

class AgendaTypesPrestation extends DataClass
    implements Insertable<AgendaTypesPrestation> {
  final int id_agenda_types_prestation;
  final String? description;
  AgendaTypesPrestation(
      {required this.id_agenda_types_prestation, this.description});
  factory AgendaTypesPrestation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AgendaTypesPrestation(
      id_agenda_types_prestation: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_agenda_types_prestation'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda_types_prestation'] =
        Variable<int>(id_agenda_types_prestation);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    return map;
  }

  AgendaTypesPrestationsCompanion toCompanion(bool nullToAbsent) {
    return AgendaTypesPrestationsCompanion(
      id_agenda_types_prestation: Value(id_agenda_types_prestation),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory AgendaTypesPrestation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AgendaTypesPrestation(
      id_agenda_types_prestation:
          serializer.fromJson<int>(json['id_agenda_types_prestation']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda_types_prestation':
          serializer.toJson<int>(id_agenda_types_prestation),
      'description': serializer.toJson<String?>(description),
    };
  }

  AgendaTypesPrestation copyWith(
          {int? id_agenda_types_prestation, String? description}) =>
      AgendaTypesPrestation(
        id_agenda_types_prestation:
            id_agenda_types_prestation ?? this.id_agenda_types_prestation,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('AgendaTypesPrestation(')
          ..write('id_agenda_types_prestation: $id_agenda_types_prestation, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_agenda_types_prestation, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgendaTypesPrestation &&
          other.id_agenda_types_prestation == this.id_agenda_types_prestation &&
          other.description == this.description);
}

class AgendaTypesPrestationsCompanion
    extends UpdateCompanion<AgendaTypesPrestation> {
  final Value<int> id_agenda_types_prestation;
  final Value<String?> description;
  const AgendaTypesPrestationsCompanion({
    this.id_agenda_types_prestation = const Value.absent(),
    this.description = const Value.absent(),
  });
  AgendaTypesPrestationsCompanion.insert({
    this.id_agenda_types_prestation = const Value.absent(),
    this.description = const Value.absent(),
  });
  static Insertable<AgendaTypesPrestation> custom({
    Expression<int>? id_agenda_types_prestation,
    Expression<String?>? description,
  }) {
    return RawValuesInsertable({
      if (id_agenda_types_prestation != null)
        'id_agenda_types_prestation': id_agenda_types_prestation,
      if (description != null) 'description': description,
    });
  }

  AgendaTypesPrestationsCompanion copyWith(
      {Value<int>? id_agenda_types_prestation, Value<String?>? description}) {
    return AgendaTypesPrestationsCompanion(
      id_agenda_types_prestation:
          id_agenda_types_prestation ?? this.id_agenda_types_prestation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda_types_prestation.present) {
      map['id_agenda_types_prestation'] =
          Variable<int>(id_agenda_types_prestation.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendaTypesPrestationsCompanion(')
          ..write('id_agenda_types_prestation: $id_agenda_types_prestation, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $AgendaTypesPrestationsTable extends AgendaTypesPrestations
    with TableInfo<$AgendaTypesPrestationsTable, AgendaTypesPrestation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendaTypesPrestationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agenda_types_prestationMeta =
      const VerificationMeta('id_agenda_types_prestation');
  @override
  late final GeneratedColumn<int?> id_agenda_types_prestation =
      GeneratedColumn<int?>('id_agenda_types_prestation', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id_agenda_types_prestation, description];
  @override
  String get aliasedName => _alias ?? 'agenda_types_prestations';
  @override
  String get actualTableName => 'agenda_types_prestations';
  @override
  VerificationContext validateIntegrity(
      Insertable<AgendaTypesPrestation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda_types_prestation')) {
      context.handle(
          _id_agenda_types_prestationMeta,
          id_agenda_types_prestation.isAcceptableOrUnknown(
              data['id_agenda_types_prestation']!,
              _id_agenda_types_prestationMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_types_prestation};
  @override
  AgendaTypesPrestation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AgendaTypesPrestation.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendaTypesPrestationsTable createAlias(String alias) {
    return $AgendaTypesPrestationsTable(attachedDatabase, alias);
  }
}

class Agenda extends DataClass implements Insertable<Agenda> {
  final int id_agenda;
  final DateTime date_agenda;
  final String? agenda_journee_type_description;
  final int? id_personne;
  Agenda(
      {required this.id_agenda,
      required this.date_agenda,
      this.agenda_journee_type_description,
      this.id_personne});
  factory Agenda.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Agenda(
      id_agenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda'])!,
      date_agenda: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_agenda'])!,
      agenda_journee_type_description: const StringType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}agenda_journee_type_description']),
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda'] = Variable<int>(id_agenda);
    map['date_agenda'] = Variable<DateTime>(date_agenda);
    if (!nullToAbsent || agenda_journee_type_description != null) {
      map['agenda_journee_type_description'] =
          Variable<String?>(agenda_journee_type_description);
    }
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    return map;
  }

  AgendasCompanion toCompanion(bool nullToAbsent) {
    return AgendasCompanion(
      id_agenda: Value(id_agenda),
      date_agenda: Value(date_agenda),
      agenda_journee_type_description:
          agenda_journee_type_description == null && nullToAbsent
              ? const Value.absent()
              : Value(agenda_journee_type_description),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
    );
  }

  factory Agenda.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Agenda(
      id_agenda: serializer.fromJson<int>(json['id_agenda']),
      date_agenda: serializer.fromJson<DateTime>(json['date_agenda']),
      agenda_journee_type_description:
          serializer.fromJson<String?>(json['agenda_journee_type_description']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda': serializer.toJson<int>(id_agenda),
      'date_agenda': serializer.toJson<DateTime>(date_agenda),
      'agenda_journee_type_description':
          serializer.toJson<String?>(agenda_journee_type_description),
      'id_personne': serializer.toJson<int?>(id_personne),
    };
  }

  Agenda copyWith(
          {int? id_agenda,
          DateTime? date_agenda,
          String? agenda_journee_type_description,
          int? id_personne}) =>
      Agenda(
        id_agenda: id_agenda ?? this.id_agenda,
        date_agenda: date_agenda ?? this.date_agenda,
        agenda_journee_type_description: agenda_journee_type_description ??
            this.agenda_journee_type_description,
        id_personne: id_personne ?? this.id_personne,
      );
  @override
  String toString() {
    return (StringBuffer('Agenda(')
          ..write('id_agenda: $id_agenda, ')
          ..write('date_agenda: $date_agenda, ')
          ..write(
              'agenda_journee_type_description: $agenda_journee_type_description, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_agenda, date_agenda, agenda_journee_type_description, id_personne);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Agenda &&
          other.id_agenda == this.id_agenda &&
          other.date_agenda == this.date_agenda &&
          other.agenda_journee_type_description ==
              this.agenda_journee_type_description &&
          other.id_personne == this.id_personne);
}

class AgendasCompanion extends UpdateCompanion<Agenda> {
  final Value<int> id_agenda;
  final Value<DateTime> date_agenda;
  final Value<String?> agenda_journee_type_description;
  final Value<int?> id_personne;
  const AgendasCompanion({
    this.id_agenda = const Value.absent(),
    this.date_agenda = const Value.absent(),
    this.agenda_journee_type_description = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  AgendasCompanion.insert({
    this.id_agenda = const Value.absent(),
    required DateTime date_agenda,
    this.agenda_journee_type_description = const Value.absent(),
    this.id_personne = const Value.absent(),
  }) : date_agenda = Value(date_agenda);
  static Insertable<Agenda> custom({
    Expression<int>? id_agenda,
    Expression<DateTime>? date_agenda,
    Expression<String?>? agenda_journee_type_description,
    Expression<int?>? id_personne,
  }) {
    return RawValuesInsertable({
      if (id_agenda != null) 'id_agenda': id_agenda,
      if (date_agenda != null) 'date_agenda': date_agenda,
      if (agenda_journee_type_description != null)
        'agenda_journee_type_description': agenda_journee_type_description,
      if (id_personne != null) 'id_personne': id_personne,
    });
  }

  AgendasCompanion copyWith(
      {Value<int>? id_agenda,
      Value<DateTime>? date_agenda,
      Value<String?>? agenda_journee_type_description,
      Value<int?>? id_personne}) {
    return AgendasCompanion(
      id_agenda: id_agenda ?? this.id_agenda,
      date_agenda: date_agenda ?? this.date_agenda,
      agenda_journee_type_description: agenda_journee_type_description ??
          this.agenda_journee_type_description,
      id_personne: id_personne ?? this.id_personne,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda.present) {
      map['id_agenda'] = Variable<int>(id_agenda.value);
    }
    if (date_agenda.present) {
      map['date_agenda'] = Variable<DateTime>(date_agenda.value);
    }
    if (agenda_journee_type_description.present) {
      map['agenda_journee_type_description'] =
          Variable<String?>(agenda_journee_type_description.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendasCompanion(')
          ..write('id_agenda: $id_agenda, ')
          ..write('date_agenda: $date_agenda, ')
          ..write(
              'agenda_journee_type_description: $agenda_journee_type_description, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }
}

class $AgendasTable extends Agendas with TableInfo<$AgendasTable, Agenda> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendasTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agendaMeta = const VerificationMeta('id_agenda');
  @override
  late final GeneratedColumn<int?> id_agenda = GeneratedColumn<int?>(
      'id_agenda', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _date_agendaMeta =
      const VerificationMeta('date_agenda');
  @override
  late final GeneratedColumn<DateTime?> date_agenda =
      GeneratedColumn<DateTime?>('date_agenda', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _agenda_journee_type_descriptionMeta =
      const VerificationMeta('agenda_journee_type_description');
  @override
  late final GeneratedColumn<String?> agenda_journee_type_description =
      GeneratedColumn<String?>(
          'agenda_journee_type_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id_agenda, date_agenda, agenda_journee_type_description, id_personne];
  @override
  String get aliasedName => _alias ?? 'agendas';
  @override
  String get actualTableName => 'agendas';
  @override
  VerificationContext validateIntegrity(Insertable<Agenda> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda')) {
      context.handle(_id_agendaMeta,
          id_agenda.isAcceptableOrUnknown(data['id_agenda']!, _id_agendaMeta));
    }
    if (data.containsKey('date_agenda')) {
      context.handle(
          _date_agendaMeta,
          date_agenda.isAcceptableOrUnknown(
              data['date_agenda']!, _date_agendaMeta));
    } else if (isInserting) {
      context.missing(_date_agendaMeta);
    }
    if (data.containsKey('agenda_journee_type_description')) {
      context.handle(
          _agenda_journee_type_descriptionMeta,
          agenda_journee_type_description.isAcceptableOrUnknown(
              data['agenda_journee_type_description']!,
              _agenda_journee_type_descriptionMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda};
  @override
  Agenda map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Agenda.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendasTable createAlias(String alias) {
    return $AgendasTable(attachedDatabase, alias);
  }
}

class PersonneEnseignant extends DataClass
    implements Insertable<PersonneEnseignant> {
  final int id_personne;
  final String? nom;
  final String? prenom;
  final int? id_agenda;
  PersonneEnseignant(
      {required this.id_personne, this.nom, this.prenom, this.id_agenda});
  factory PersonneEnseignant.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PersonneEnseignant(
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      nom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom']),
      prenom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom']),
      id_agenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_personne'] = Variable<int>(id_personne);
    if (!nullToAbsent || nom != null) {
      map['nom'] = Variable<String?>(nom);
    }
    if (!nullToAbsent || prenom != null) {
      map['prenom'] = Variable<String?>(prenom);
    }
    if (!nullToAbsent || id_agenda != null) {
      map['id_agenda'] = Variable<int?>(id_agenda);
    }
    return map;
  }

  PersonneEnseignantsCompanion toCompanion(bool nullToAbsent) {
    return PersonneEnseignantsCompanion(
      id_personne: Value(id_personne),
      nom: nom == null && nullToAbsent ? const Value.absent() : Value(nom),
      prenom:
          prenom == null && nullToAbsent ? const Value.absent() : Value(prenom),
      id_agenda: id_agenda == null && nullToAbsent
          ? const Value.absent()
          : Value(id_agenda),
    );
  }

  factory PersonneEnseignant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PersonneEnseignant(
      id_personne: serializer.fromJson<int>(json['id_personne']),
      nom: serializer.fromJson<String?>(json['nom']),
      prenom: serializer.fromJson<String?>(json['prenom']),
      id_agenda: serializer.fromJson<int?>(json['id_agenda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_personne': serializer.toJson<int>(id_personne),
      'nom': serializer.toJson<String?>(nom),
      'prenom': serializer.toJson<String?>(prenom),
      'id_agenda': serializer.toJson<int?>(id_agenda),
    };
  }

  PersonneEnseignant copyWith(
          {int? id_personne, String? nom, String? prenom, int? id_agenda}) =>
      PersonneEnseignant(
        id_personne: id_personne ?? this.id_personne,
        nom: nom ?? this.nom,
        prenom: prenom ?? this.prenom,
        id_agenda: id_agenda ?? this.id_agenda,
      );
  @override
  String toString() {
    return (StringBuffer('PersonneEnseignant(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('id_agenda: $id_agenda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_personne, nom, prenom, id_agenda);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonneEnseignant &&
          other.id_personne == this.id_personne &&
          other.nom == this.nom &&
          other.prenom == this.prenom &&
          other.id_agenda == this.id_agenda);
}

class PersonneEnseignantsCompanion extends UpdateCompanion<PersonneEnseignant> {
  final Value<int> id_personne;
  final Value<String?> nom;
  final Value<String?> prenom;
  final Value<int?> id_agenda;
  const PersonneEnseignantsCompanion({
    this.id_personne = const Value.absent(),
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.id_agenda = const Value.absent(),
  });
  PersonneEnseignantsCompanion.insert({
    required int id_personne,
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.id_agenda = const Value.absent(),
  }) : id_personne = Value(id_personne);
  static Insertable<PersonneEnseignant> custom({
    Expression<int>? id_personne,
    Expression<String?>? nom,
    Expression<String?>? prenom,
    Expression<int?>? id_agenda,
  }) {
    return RawValuesInsertable({
      if (id_personne != null) 'id_personne': id_personne,
      if (nom != null) 'nom': nom,
      if (prenom != null) 'prenom': prenom,
      if (id_agenda != null) 'id_agenda': id_agenda,
    });
  }

  PersonneEnseignantsCompanion copyWith(
      {Value<int>? id_personne,
      Value<String?>? nom,
      Value<String?>? prenom,
      Value<int?>? id_agenda}) {
    return PersonneEnseignantsCompanion(
      id_personne: id_personne ?? this.id_personne,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      id_agenda: id_agenda ?? this.id_agenda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String?>(nom.value);
    }
    if (prenom.present) {
      map['prenom'] = Variable<String?>(prenom.value);
    }
    if (id_agenda.present) {
      map['id_agenda'] = Variable<int?>(id_agenda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonneEnseignantsCompanion(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('id_agenda: $id_agenda')
          ..write(')'))
        .toString();
  }
}

class $PersonneEnseignantsTable extends PersonneEnseignants
    with TableInfo<$PersonneEnseignantsTable, PersonneEnseignant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonneEnseignantsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String?> nom = GeneratedColumn<String?>(
      'nom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _prenomMeta = const VerificationMeta('prenom');
  @override
  late final GeneratedColumn<String?> prenom = GeneratedColumn<String?>(
      'prenom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _id_agendaMeta = const VerificationMeta('id_agenda');
  @override
  late final GeneratedColumn<int?> id_agenda = GeneratedColumn<int?>(
      'id_agenda', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id_personne, nom, prenom, id_agenda];
  @override
  String get aliasedName => _alias ?? 'personne_enseignants';
  @override
  String get actualTableName => 'personne_enseignants';
  @override
  VerificationContext validateIntegrity(Insertable<PersonneEnseignant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    } else if (isInserting) {
      context.missing(_id_personneMeta);
    }
    if (data.containsKey('nom')) {
      context.handle(
          _nomMeta, nom.isAcceptableOrUnknown(data['nom']!, _nomMeta));
    }
    if (data.containsKey('prenom')) {
      context.handle(_prenomMeta,
          prenom.isAcceptableOrUnknown(data['prenom']!, _prenomMeta));
    }
    if (data.containsKey('id_agenda')) {
      context.handle(_id_agendaMeta,
          id_agenda.isAcceptableOrUnknown(data['id_agenda']!, _id_agendaMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda};
  @override
  PersonneEnseignant map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PersonneEnseignant.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PersonneEnseignantsTable createAlias(String alias) {
    return $PersonneEnseignantsTable(attachedDatabase, alias);
  }
}

class AgendaPhotoDetail extends DataClass
    implements Insertable<AgendaPhotoDetail> {
  final int id_agenda_photo_detail;
  final String? nom_original_photo;
  final String? lieu_photo;
  final int? position;
  final int? id_agenda;
  final int? id_personne;
  AgendaPhotoDetail(
      {required this.id_agenda_photo_detail,
      this.nom_original_photo,
      this.lieu_photo,
      this.position,
      this.id_agenda,
      this.id_personne});
  factory AgendaPhotoDetail.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AgendaPhotoDetail(
      id_agenda_photo_detail: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_agenda_photo_detail'])!,
      nom_original_photo: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}nom_original_photo']),
      lieu_photo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lieu_photo']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position']),
      id_agenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda']),
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda_photo_detail'] = Variable<int>(id_agenda_photo_detail);
    if (!nullToAbsent || nom_original_photo != null) {
      map['nom_original_photo'] = Variable<String?>(nom_original_photo);
    }
    if (!nullToAbsent || lieu_photo != null) {
      map['lieu_photo'] = Variable<String?>(lieu_photo);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int?>(position);
    }
    if (!nullToAbsent || id_agenda != null) {
      map['id_agenda'] = Variable<int?>(id_agenda);
    }
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    return map;
  }

  AgendaPhotoDetailsCompanion toCompanion(bool nullToAbsent) {
    return AgendaPhotoDetailsCompanion(
      id_agenda_photo_detail: Value(id_agenda_photo_detail),
      nom_original_photo: nom_original_photo == null && nullToAbsent
          ? const Value.absent()
          : Value(nom_original_photo),
      lieu_photo: lieu_photo == null && nullToAbsent
          ? const Value.absent()
          : Value(lieu_photo),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      id_agenda: id_agenda == null && nullToAbsent
          ? const Value.absent()
          : Value(id_agenda),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
    );
  }

  factory AgendaPhotoDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AgendaPhotoDetail(
      id_agenda_photo_detail:
          serializer.fromJson<int>(json['id_agenda_photo_detail']),
      nom_original_photo:
          serializer.fromJson<String?>(json['nom_original_photo']),
      lieu_photo: serializer.fromJson<String?>(json['lieu_photo']),
      position: serializer.fromJson<int?>(json['position']),
      id_agenda: serializer.fromJson<int?>(json['id_agenda']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda_photo_detail': serializer.toJson<int>(id_agenda_photo_detail),
      'nom_original_photo': serializer.toJson<String?>(nom_original_photo),
      'lieu_photo': serializer.toJson<String?>(lieu_photo),
      'position': serializer.toJson<int?>(position),
      'id_agenda': serializer.toJson<int?>(id_agenda),
      'id_personne': serializer.toJson<int?>(id_personne),
    };
  }

  AgendaPhotoDetail copyWith(
          {int? id_agenda_photo_detail,
          String? nom_original_photo,
          String? lieu_photo,
          int? position,
          int? id_agenda,
          int? id_personne}) =>
      AgendaPhotoDetail(
        id_agenda_photo_detail:
            id_agenda_photo_detail ?? this.id_agenda_photo_detail,
        nom_original_photo: nom_original_photo ?? this.nom_original_photo,
        lieu_photo: lieu_photo ?? this.lieu_photo,
        position: position ?? this.position,
        id_agenda: id_agenda ?? this.id_agenda,
        id_personne: id_personne ?? this.id_personne,
      );
  @override
  String toString() {
    return (StringBuffer('AgendaPhotoDetail(')
          ..write('id_agenda_photo_detail: $id_agenda_photo_detail, ')
          ..write('nom_original_photo: $nom_original_photo, ')
          ..write('lieu_photo: $lieu_photo, ')
          ..write('position: $position, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_agenda_photo_detail, nom_original_photo,
      lieu_photo, position, id_agenda, id_personne);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgendaPhotoDetail &&
          other.id_agenda_photo_detail == this.id_agenda_photo_detail &&
          other.nom_original_photo == this.nom_original_photo &&
          other.lieu_photo == this.lieu_photo &&
          other.position == this.position &&
          other.id_agenda == this.id_agenda &&
          other.id_personne == this.id_personne);
}

class AgendaPhotoDetailsCompanion extends UpdateCompanion<AgendaPhotoDetail> {
  final Value<int> id_agenda_photo_detail;
  final Value<String?> nom_original_photo;
  final Value<String?> lieu_photo;
  final Value<int?> position;
  final Value<int?> id_agenda;
  final Value<int?> id_personne;
  const AgendaPhotoDetailsCompanion({
    this.id_agenda_photo_detail = const Value.absent(),
    this.nom_original_photo = const Value.absent(),
    this.lieu_photo = const Value.absent(),
    this.position = const Value.absent(),
    this.id_agenda = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  AgendaPhotoDetailsCompanion.insert({
    this.id_agenda_photo_detail = const Value.absent(),
    this.nom_original_photo = const Value.absent(),
    this.lieu_photo = const Value.absent(),
    this.position = const Value.absent(),
    this.id_agenda = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  static Insertable<AgendaPhotoDetail> custom({
    Expression<int>? id_agenda_photo_detail,
    Expression<String?>? nom_original_photo,
    Expression<String?>? lieu_photo,
    Expression<int?>? position,
    Expression<int?>? id_agenda,
    Expression<int?>? id_personne,
  }) {
    return RawValuesInsertable({
      if (id_agenda_photo_detail != null)
        'id_agenda_photo_detail': id_agenda_photo_detail,
      if (nom_original_photo != null) 'nom_original_photo': nom_original_photo,
      if (lieu_photo != null) 'lieu_photo': lieu_photo,
      if (position != null) 'position': position,
      if (id_agenda != null) 'id_agenda': id_agenda,
      if (id_personne != null) 'id_personne': id_personne,
    });
  }

  AgendaPhotoDetailsCompanion copyWith(
      {Value<int>? id_agenda_photo_detail,
      Value<String?>? nom_original_photo,
      Value<String?>? lieu_photo,
      Value<int?>? position,
      Value<int?>? id_agenda,
      Value<int?>? id_personne}) {
    return AgendaPhotoDetailsCompanion(
      id_agenda_photo_detail:
          id_agenda_photo_detail ?? this.id_agenda_photo_detail,
      nom_original_photo: nom_original_photo ?? this.nom_original_photo,
      lieu_photo: lieu_photo ?? this.lieu_photo,
      position: position ?? this.position,
      id_agenda: id_agenda ?? this.id_agenda,
      id_personne: id_personne ?? this.id_personne,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda_photo_detail.present) {
      map['id_agenda_photo_detail'] =
          Variable<int>(id_agenda_photo_detail.value);
    }
    if (nom_original_photo.present) {
      map['nom_original_photo'] = Variable<String?>(nom_original_photo.value);
    }
    if (lieu_photo.present) {
      map['lieu_photo'] = Variable<String?>(lieu_photo.value);
    }
    if (position.present) {
      map['position'] = Variable<int?>(position.value);
    }
    if (id_agenda.present) {
      map['id_agenda'] = Variable<int?>(id_agenda.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendaPhotoDetailsCompanion(')
          ..write('id_agenda_photo_detail: $id_agenda_photo_detail, ')
          ..write('nom_original_photo: $nom_original_photo, ')
          ..write('lieu_photo: $lieu_photo, ')
          ..write('position: $position, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }
}

class $AgendaPhotoDetailsTable extends AgendaPhotoDetails
    with TableInfo<$AgendaPhotoDetailsTable, AgendaPhotoDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendaPhotoDetailsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agenda_photo_detailMeta =
      const VerificationMeta('id_agenda_photo_detail');
  @override
  late final GeneratedColumn<int?> id_agenda_photo_detail =
      GeneratedColumn<int?>('id_agenda_photo_detail', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nom_original_photoMeta =
      const VerificationMeta('nom_original_photo');
  @override
  late final GeneratedColumn<String?> nom_original_photo =
      GeneratedColumn<String?>('nom_original_photo', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lieu_photoMeta = const VerificationMeta('lieu_photo');
  @override
  late final GeneratedColumn<String?> lieu_photo = GeneratedColumn<String?>(
      'lieu_photo', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_agendaMeta = const VerificationMeta('id_agenda');
  @override
  late final GeneratedColumn<int?> id_agenda = GeneratedColumn<int?>(
      'id_agenda', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_agenda_photo_detail,
        nom_original_photo,
        lieu_photo,
        position,
        id_agenda,
        id_personne
      ];
  @override
  String get aliasedName => _alias ?? 'agenda_photo_details';
  @override
  String get actualTableName => 'agenda_photo_details';
  @override
  VerificationContext validateIntegrity(Insertable<AgendaPhotoDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda_photo_detail')) {
      context.handle(
          _id_agenda_photo_detailMeta,
          id_agenda_photo_detail.isAcceptableOrUnknown(
              data['id_agenda_photo_detail']!, _id_agenda_photo_detailMeta));
    }
    if (data.containsKey('nom_original_photo')) {
      context.handle(
          _nom_original_photoMeta,
          nom_original_photo.isAcceptableOrUnknown(
              data['nom_original_photo']!, _nom_original_photoMeta));
    }
    if (data.containsKey('lieu_photo')) {
      context.handle(
          _lieu_photoMeta,
          lieu_photo.isAcceptableOrUnknown(
              data['lieu_photo']!, _lieu_photoMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('id_agenda')) {
      context.handle(_id_agendaMeta,
          id_agenda.isAcceptableOrUnknown(data['id_agenda']!, _id_agendaMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_photo_detail};
  @override
  AgendaPhotoDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AgendaPhotoDetail.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendaPhotoDetailsTable createAlias(String alias) {
    return $AgendaPhotoDetailsTable(attachedDatabase, alias);
  }
}

class AgendaNote extends DataClass implements Insertable<AgendaNote> {
  final int id_agenda_note;
  final String note;
  final DateTime? date_agenda_note;
  final int id_agenda;
  final bool? send;
  AgendaNote(
      {required this.id_agenda_note,
      required this.note,
      this.date_agenda_note,
      required this.id_agenda,
      this.send});
  factory AgendaNote.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AgendaNote(
      id_agenda_note: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda_note'])!,
      note: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}note'])!,
      date_agenda_note: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_agenda_note']),
      id_agenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda'])!,
      send: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}send']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda_note'] = Variable<int>(id_agenda_note);
    map['note'] = Variable<String>(note);
    if (!nullToAbsent || date_agenda_note != null) {
      map['date_agenda_note'] = Variable<DateTime?>(date_agenda_note);
    }
    map['id_agenda'] = Variable<int>(id_agenda);
    if (!nullToAbsent || send != null) {
      map['send'] = Variable<bool?>(send);
    }
    return map;
  }

  AgendaNotesCompanion toCompanion(bool nullToAbsent) {
    return AgendaNotesCompanion(
      id_agenda_note: Value(id_agenda_note),
      note: Value(note),
      date_agenda_note: date_agenda_note == null && nullToAbsent
          ? const Value.absent()
          : Value(date_agenda_note),
      id_agenda: Value(id_agenda),
      send: send == null && nullToAbsent ? const Value.absent() : Value(send),
    );
  }

  factory AgendaNote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AgendaNote(
      id_agenda_note: serializer.fromJson<int>(json['id_agenda_note']),
      note: serializer.fromJson<String>(json['note']),
      date_agenda_note:
          serializer.fromJson<DateTime?>(json['date_agenda_note']),
      id_agenda: serializer.fromJson<int>(json['id_agenda']),
      send: serializer.fromJson<bool?>(json['send']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda_note': serializer.toJson<int>(id_agenda_note),
      'note': serializer.toJson<String>(note),
      'date_agenda_note': serializer.toJson<DateTime?>(date_agenda_note),
      'id_agenda': serializer.toJson<int>(id_agenda),
      'send': serializer.toJson<bool?>(send),
    };
  }

  AgendaNote copyWith(
          {int? id_agenda_note,
          String? note,
          DateTime? date_agenda_note,
          int? id_agenda,
          bool? send}) =>
      AgendaNote(
        id_agenda_note: id_agenda_note ?? this.id_agenda_note,
        note: note ?? this.note,
        date_agenda_note: date_agenda_note ?? this.date_agenda_note,
        id_agenda: id_agenda ?? this.id_agenda,
        send: send ?? this.send,
      );
  @override
  String toString() {
    return (StringBuffer('AgendaNote(')
          ..write('id_agenda_note: $id_agenda_note, ')
          ..write('note: $note, ')
          ..write('date_agenda_note: $date_agenda_note, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id_agenda_note, note, date_agenda_note, id_agenda, send);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgendaNote &&
          other.id_agenda_note == this.id_agenda_note &&
          other.note == this.note &&
          other.date_agenda_note == this.date_agenda_note &&
          other.id_agenda == this.id_agenda &&
          other.send == this.send);
}

class AgendaNotesCompanion extends UpdateCompanion<AgendaNote> {
  final Value<int> id_agenda_note;
  final Value<String> note;
  final Value<DateTime?> date_agenda_note;
  final Value<int> id_agenda;
  final Value<bool?> send;
  const AgendaNotesCompanion({
    this.id_agenda_note = const Value.absent(),
    this.note = const Value.absent(),
    this.date_agenda_note = const Value.absent(),
    this.id_agenda = const Value.absent(),
    this.send = const Value.absent(),
  });
  AgendaNotesCompanion.insert({
    this.id_agenda_note = const Value.absent(),
    required String note,
    this.date_agenda_note = const Value.absent(),
    required int id_agenda,
    this.send = const Value.absent(),
  })  : note = Value(note),
        id_agenda = Value(id_agenda);
  static Insertable<AgendaNote> custom({
    Expression<int>? id_agenda_note,
    Expression<String>? note,
    Expression<DateTime?>? date_agenda_note,
    Expression<int>? id_agenda,
    Expression<bool?>? send,
  }) {
    return RawValuesInsertable({
      if (id_agenda_note != null) 'id_agenda_note': id_agenda_note,
      if (note != null) 'note': note,
      if (date_agenda_note != null) 'date_agenda_note': date_agenda_note,
      if (id_agenda != null) 'id_agenda': id_agenda,
      if (send != null) 'send': send,
    });
  }

  AgendaNotesCompanion copyWith(
      {Value<int>? id_agenda_note,
      Value<String>? note,
      Value<DateTime?>? date_agenda_note,
      Value<int>? id_agenda,
      Value<bool?>? send}) {
    return AgendaNotesCompanion(
      id_agenda_note: id_agenda_note ?? this.id_agenda_note,
      note: note ?? this.note,
      date_agenda_note: date_agenda_note ?? this.date_agenda_note,
      id_agenda: id_agenda ?? this.id_agenda,
      send: send ?? this.send,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda_note.present) {
      map['id_agenda_note'] = Variable<int>(id_agenda_note.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (date_agenda_note.present) {
      map['date_agenda_note'] = Variable<DateTime?>(date_agenda_note.value);
    }
    if (id_agenda.present) {
      map['id_agenda'] = Variable<int>(id_agenda.value);
    }
    if (send.present) {
      map['send'] = Variable<bool?>(send.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendaNotesCompanion(')
          ..write('id_agenda_note: $id_agenda_note, ')
          ..write('note: $note, ')
          ..write('date_agenda_note: $date_agenda_note, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }
}

class $AgendaNotesTable extends AgendaNotes
    with TableInfo<$AgendaNotesTable, AgendaNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendaNotesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agenda_noteMeta =
      const VerificationMeta('id_agenda_note');
  @override
  late final GeneratedColumn<int?> id_agenda_note = GeneratedColumn<int?>(
      'id_agenda_note', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String?> note = GeneratedColumn<String?>(
      'note', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _date_agenda_noteMeta =
      const VerificationMeta('date_agenda_note');
  @override
  late final GeneratedColumn<DateTime?> date_agenda_note =
      GeneratedColumn<DateTime?>('date_agenda_note', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_agendaMeta = const VerificationMeta('id_agenda');
  @override
  late final GeneratedColumn<int?> id_agenda = GeneratedColumn<int?>(
      'id_agenda', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sendMeta = const VerificationMeta('send');
  @override
  late final GeneratedColumn<bool?> send = GeneratedColumn<bool?>(
      'send', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (send IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id_agenda_note, note, date_agenda_note, id_agenda, send];
  @override
  String get aliasedName => _alias ?? 'agenda_notes';
  @override
  String get actualTableName => 'agenda_notes';
  @override
  VerificationContext validateIntegrity(Insertable<AgendaNote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda_note')) {
      context.handle(
          _id_agenda_noteMeta,
          id_agenda_note.isAcceptableOrUnknown(
              data['id_agenda_note']!, _id_agenda_noteMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('date_agenda_note')) {
      context.handle(
          _date_agenda_noteMeta,
          date_agenda_note.isAcceptableOrUnknown(
              data['date_agenda_note']!, _date_agenda_noteMeta));
    }
    if (data.containsKey('id_agenda')) {
      context.handle(_id_agendaMeta,
          id_agenda.isAcceptableOrUnknown(data['id_agenda']!, _id_agendaMeta));
    } else if (isInserting) {
      context.missing(_id_agendaMeta);
    }
    if (data.containsKey('send')) {
      context.handle(
          _sendMeta, send.isAcceptableOrUnknown(data['send']!, _sendMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_note};
  @override
  AgendaNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AgendaNote.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendaNotesTable createAlias(String alias) {
    return $AgendaNotesTable(attachedDatabase, alias);
  }
}

class PersonneNote extends DataClass implements Insertable<PersonneNote> {
  final int id_personne;
  final String? nom;
  final String? prenom;
  final int? id_agenda_note;
  PersonneNote(
      {required this.id_personne, this.nom, this.prenom, this.id_agenda_note});
  factory PersonneNote.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PersonneNote(
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      nom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom']),
      prenom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom']),
      id_agenda_note: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda_note']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_personne'] = Variable<int>(id_personne);
    if (!nullToAbsent || nom != null) {
      map['nom'] = Variable<String?>(nom);
    }
    if (!nullToAbsent || prenom != null) {
      map['prenom'] = Variable<String?>(prenom);
    }
    if (!nullToAbsent || id_agenda_note != null) {
      map['id_agenda_note'] = Variable<int?>(id_agenda_note);
    }
    return map;
  }

  PersonneNotesCompanion toCompanion(bool nullToAbsent) {
    return PersonneNotesCompanion(
      id_personne: Value(id_personne),
      nom: nom == null && nullToAbsent ? const Value.absent() : Value(nom),
      prenom:
          prenom == null && nullToAbsent ? const Value.absent() : Value(prenom),
      id_agenda_note: id_agenda_note == null && nullToAbsent
          ? const Value.absent()
          : Value(id_agenda_note),
    );
  }

  factory PersonneNote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PersonneNote(
      id_personne: serializer.fromJson<int>(json['id_personne']),
      nom: serializer.fromJson<String?>(json['nom']),
      prenom: serializer.fromJson<String?>(json['prenom']),
      id_agenda_note: serializer.fromJson<int?>(json['id_agenda_note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_personne': serializer.toJson<int>(id_personne),
      'nom': serializer.toJson<String?>(nom),
      'prenom': serializer.toJson<String?>(prenom),
      'id_agenda_note': serializer.toJson<int?>(id_agenda_note),
    };
  }

  PersonneNote copyWith(
          {int? id_personne,
          String? nom,
          String? prenom,
          int? id_agenda_note}) =>
      PersonneNote(
        id_personne: id_personne ?? this.id_personne,
        nom: nom ?? this.nom,
        prenom: prenom ?? this.prenom,
        id_agenda_note: id_agenda_note ?? this.id_agenda_note,
      );
  @override
  String toString() {
    return (StringBuffer('PersonneNote(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('id_agenda_note: $id_agenda_note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_personne, nom, prenom, id_agenda_note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonneNote &&
          other.id_personne == this.id_personne &&
          other.nom == this.nom &&
          other.prenom == this.prenom &&
          other.id_agenda_note == this.id_agenda_note);
}

class PersonneNotesCompanion extends UpdateCompanion<PersonneNote> {
  final Value<int> id_personne;
  final Value<String?> nom;
  final Value<String?> prenom;
  final Value<int?> id_agenda_note;
  const PersonneNotesCompanion({
    this.id_personne = const Value.absent(),
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.id_agenda_note = const Value.absent(),
  });
  PersonneNotesCompanion.insert({
    required int id_personne,
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.id_agenda_note = const Value.absent(),
  }) : id_personne = Value(id_personne);
  static Insertable<PersonneNote> custom({
    Expression<int>? id_personne,
    Expression<String?>? nom,
    Expression<String?>? prenom,
    Expression<int?>? id_agenda_note,
  }) {
    return RawValuesInsertable({
      if (id_personne != null) 'id_personne': id_personne,
      if (nom != null) 'nom': nom,
      if (prenom != null) 'prenom': prenom,
      if (id_agenda_note != null) 'id_agenda_note': id_agenda_note,
    });
  }

  PersonneNotesCompanion copyWith(
      {Value<int>? id_personne,
      Value<String?>? nom,
      Value<String?>? prenom,
      Value<int?>? id_agenda_note}) {
    return PersonneNotesCompanion(
      id_personne: id_personne ?? this.id_personne,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      id_agenda_note: id_agenda_note ?? this.id_agenda_note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String?>(nom.value);
    }
    if (prenom.present) {
      map['prenom'] = Variable<String?>(prenom.value);
    }
    if (id_agenda_note.present) {
      map['id_agenda_note'] = Variable<int?>(id_agenda_note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonneNotesCompanion(')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('id_agenda_note: $id_agenda_note')
          ..write(')'))
        .toString();
  }
}

class $PersonneNotesTable extends PersonneNotes
    with TableInfo<$PersonneNotesTable, PersonneNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonneNotesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String?> nom = GeneratedColumn<String?>(
      'nom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _prenomMeta = const VerificationMeta('prenom');
  @override
  late final GeneratedColumn<String?> prenom = GeneratedColumn<String?>(
      'prenom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _id_agenda_noteMeta =
      const VerificationMeta('id_agenda_note');
  @override
  late final GeneratedColumn<int?> id_agenda_note = GeneratedColumn<int?>(
      'id_agenda_note', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id_personne, nom, prenom, id_agenda_note];
  @override
  String get aliasedName => _alias ?? 'personne_notes';
  @override
  String get actualTableName => 'personne_notes';
  @override
  VerificationContext validateIntegrity(Insertable<PersonneNote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    } else if (isInserting) {
      context.missing(_id_personneMeta);
    }
    if (data.containsKey('nom')) {
      context.handle(
          _nomMeta, nom.isAcceptableOrUnknown(data['nom']!, _nomMeta));
    }
    if (data.containsKey('prenom')) {
      context.handle(_prenomMeta,
          prenom.isAcceptableOrUnknown(data['prenom']!, _prenomMeta));
    }
    if (data.containsKey('id_agenda_note')) {
      context.handle(
          _id_agenda_noteMeta,
          id_agenda_note.isAcceptableOrUnknown(
              data['id_agenda_note']!, _id_agenda_noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_note};
  @override
  PersonneNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PersonneNote.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PersonneNotesTable createAlias(String alias) {
    return $PersonneNotesTable(attachedDatabase, alias);
  }
}

class AgendaDetail extends DataClass implements Insertable<AgendaDetail> {
  final int id_agenda_detail;
  final int? id_agenda;
  final int id_agenda_type_detail;
  final int position;
  final DateTime? agenda_retard;
  AgendaDetail(
      {required this.id_agenda_detail,
      this.id_agenda,
      required this.id_agenda_type_detail,
      required this.position,
      this.agenda_retard});
  factory AgendaDetail.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AgendaDetail(
      id_agenda_detail: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda_detail'])!,
      id_agenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda']),
      id_agenda_type_detail: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_agenda_type_detail'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      agenda_retard: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}agenda_retard']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda_detail'] = Variable<int>(id_agenda_detail);
    if (!nullToAbsent || id_agenda != null) {
      map['id_agenda'] = Variable<int?>(id_agenda);
    }
    map['id_agenda_type_detail'] = Variable<int>(id_agenda_type_detail);
    map['position'] = Variable<int>(position);
    if (!nullToAbsent || agenda_retard != null) {
      map['agenda_retard'] = Variable<DateTime?>(agenda_retard);
    }
    return map;
  }

  AgendaDetailsCompanion toCompanion(bool nullToAbsent) {
    return AgendaDetailsCompanion(
      id_agenda_detail: Value(id_agenda_detail),
      id_agenda: id_agenda == null && nullToAbsent
          ? const Value.absent()
          : Value(id_agenda),
      id_agenda_type_detail: Value(id_agenda_type_detail),
      position: Value(position),
      agenda_retard: agenda_retard == null && nullToAbsent
          ? const Value.absent()
          : Value(agenda_retard),
    );
  }

  factory AgendaDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AgendaDetail(
      id_agenda_detail: serializer.fromJson<int>(json['id_agenda_detail']),
      id_agenda: serializer.fromJson<int?>(json['id_agenda']),
      id_agenda_type_detail:
          serializer.fromJson<int>(json['id_agenda_type_detail']),
      position: serializer.fromJson<int>(json['position']),
      agenda_retard: serializer.fromJson<DateTime?>(json['agenda_retard']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda_detail': serializer.toJson<int>(id_agenda_detail),
      'id_agenda': serializer.toJson<int?>(id_agenda),
      'id_agenda_type_detail': serializer.toJson<int>(id_agenda_type_detail),
      'position': serializer.toJson<int>(position),
      'agenda_retard': serializer.toJson<DateTime?>(agenda_retard),
    };
  }

  AgendaDetail copyWith(
          {int? id_agenda_detail,
          int? id_agenda,
          int? id_agenda_type_detail,
          int? position,
          DateTime? agenda_retard}) =>
      AgendaDetail(
        id_agenda_detail: id_agenda_detail ?? this.id_agenda_detail,
        id_agenda: id_agenda ?? this.id_agenda,
        id_agenda_type_detail:
            id_agenda_type_detail ?? this.id_agenda_type_detail,
        position: position ?? this.position,
        agenda_retard: agenda_retard ?? this.agenda_retard,
      );
  @override
  String toString() {
    return (StringBuffer('AgendaDetail(')
          ..write('id_agenda_detail: $id_agenda_detail, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('id_agenda_type_detail: $id_agenda_type_detail, ')
          ..write('position: $position, ')
          ..write('agenda_retard: $agenda_retard')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_agenda_detail, id_agenda,
      id_agenda_type_detail, position, agenda_retard);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgendaDetail &&
          other.id_agenda_detail == this.id_agenda_detail &&
          other.id_agenda == this.id_agenda &&
          other.id_agenda_type_detail == this.id_agenda_type_detail &&
          other.position == this.position &&
          other.agenda_retard == this.agenda_retard);
}

class AgendaDetailsCompanion extends UpdateCompanion<AgendaDetail> {
  final Value<int> id_agenda_detail;
  final Value<int?> id_agenda;
  final Value<int> id_agenda_type_detail;
  final Value<int> position;
  final Value<DateTime?> agenda_retard;
  const AgendaDetailsCompanion({
    this.id_agenda_detail = const Value.absent(),
    this.id_agenda = const Value.absent(),
    this.id_agenda_type_detail = const Value.absent(),
    this.position = const Value.absent(),
    this.agenda_retard = const Value.absent(),
  });
  AgendaDetailsCompanion.insert({
    this.id_agenda_detail = const Value.absent(),
    this.id_agenda = const Value.absent(),
    required int id_agenda_type_detail,
    this.position = const Value.absent(),
    this.agenda_retard = const Value.absent(),
  }) : id_agenda_type_detail = Value(id_agenda_type_detail);
  static Insertable<AgendaDetail> custom({
    Expression<int>? id_agenda_detail,
    Expression<int?>? id_agenda,
    Expression<int>? id_agenda_type_detail,
    Expression<int>? position,
    Expression<DateTime?>? agenda_retard,
  }) {
    return RawValuesInsertable({
      if (id_agenda_detail != null) 'id_agenda_detail': id_agenda_detail,
      if (id_agenda != null) 'id_agenda': id_agenda,
      if (id_agenda_type_detail != null)
        'id_agenda_type_detail': id_agenda_type_detail,
      if (position != null) 'position': position,
      if (agenda_retard != null) 'agenda_retard': agenda_retard,
    });
  }

  AgendaDetailsCompanion copyWith(
      {Value<int>? id_agenda_detail,
      Value<int?>? id_agenda,
      Value<int>? id_agenda_type_detail,
      Value<int>? position,
      Value<DateTime?>? agenda_retard}) {
    return AgendaDetailsCompanion(
      id_agenda_detail: id_agenda_detail ?? this.id_agenda_detail,
      id_agenda: id_agenda ?? this.id_agenda,
      id_agenda_type_detail:
          id_agenda_type_detail ?? this.id_agenda_type_detail,
      position: position ?? this.position,
      agenda_retard: agenda_retard ?? this.agenda_retard,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda_detail.present) {
      map['id_agenda_detail'] = Variable<int>(id_agenda_detail.value);
    }
    if (id_agenda.present) {
      map['id_agenda'] = Variable<int?>(id_agenda.value);
    }
    if (id_agenda_type_detail.present) {
      map['id_agenda_type_detail'] = Variable<int>(id_agenda_type_detail.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (agenda_retard.present) {
      map['agenda_retard'] = Variable<DateTime?>(agenda_retard.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendaDetailsCompanion(')
          ..write('id_agenda_detail: $id_agenda_detail, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('id_agenda_type_detail: $id_agenda_type_detail, ')
          ..write('position: $position, ')
          ..write('agenda_retard: $agenda_retard')
          ..write(')'))
        .toString();
  }
}

class $AgendaDetailsTable extends AgendaDetails
    with TableInfo<$AgendaDetailsTable, AgendaDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendaDetailsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agenda_detailMeta =
      const VerificationMeta('id_agenda_detail');
  @override
  late final GeneratedColumn<int?> id_agenda_detail = GeneratedColumn<int?>(
      'id_agenda_detail', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_agendaMeta = const VerificationMeta('id_agenda');
  @override
  late final GeneratedColumn<int?> id_agenda = GeneratedColumn<int?>(
      'id_agenda', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_agenda_type_detailMeta =
      const VerificationMeta('id_agenda_type_detail');
  @override
  late final GeneratedColumn<int?> id_agenda_type_detail =
      GeneratedColumn<int?>('id_agenda_type_detail', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _agenda_retardMeta =
      const VerificationMeta('agenda_retard');
  @override
  late final GeneratedColumn<DateTime?> agenda_retard =
      GeneratedColumn<DateTime?>('agenda_retard', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_agenda_detail,
        id_agenda,
        id_agenda_type_detail,
        position,
        agenda_retard
      ];
  @override
  String get aliasedName => _alias ?? 'agenda_details';
  @override
  String get actualTableName => 'agenda_details';
  @override
  VerificationContext validateIntegrity(Insertable<AgendaDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda_detail')) {
      context.handle(
          _id_agenda_detailMeta,
          id_agenda_detail.isAcceptableOrUnknown(
              data['id_agenda_detail']!, _id_agenda_detailMeta));
    }
    if (data.containsKey('id_agenda')) {
      context.handle(_id_agendaMeta,
          id_agenda.isAcceptableOrUnknown(data['id_agenda']!, _id_agendaMeta));
    }
    if (data.containsKey('id_agenda_type_detail')) {
      context.handle(
          _id_agenda_type_detailMeta,
          id_agenda_type_detail.isAcceptableOrUnknown(
              data['id_agenda_type_detail']!, _id_agenda_type_detailMeta));
    } else if (isInserting) {
      context.missing(_id_agenda_type_detailMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('agenda_retard')) {
      context.handle(
          _agenda_retardMeta,
          agenda_retard.isAcceptableOrUnknown(
              data['agenda_retard']!, _agenda_retardMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_detail};
  @override
  AgendaDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AgendaDetail.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendaDetailsTable createAlias(String alias) {
    return $AgendaDetailsTable(attachedDatabase, alias);
  }
}

class AddNote extends DataClass implements Insertable<AddNote> {
  final int id_agenda_note;
  final int id_agenda;
  final int? id_personne;
  final String note;
  final int? id_agenda_statut;
  final DateTime? date_agenda_note;
  final bool? send;
  AddNote(
      {required this.id_agenda_note,
      required this.id_agenda,
      this.id_personne,
      required this.note,
      this.id_agenda_statut,
      this.date_agenda_note,
      this.send});
  factory AddNote.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AddNote(
      id_agenda_note: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda_note'])!,
      id_agenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
      note: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}note'])!,
      id_agenda_statut: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_agenda_statut']),
      date_agenda_note: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_agenda_note']),
      send: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}send']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_agenda_note'] = Variable<int>(id_agenda_note);
    map['id_agenda'] = Variable<int>(id_agenda);
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    map['note'] = Variable<String>(note);
    if (!nullToAbsent || id_agenda_statut != null) {
      map['id_agenda_statut'] = Variable<int?>(id_agenda_statut);
    }
    if (!nullToAbsent || date_agenda_note != null) {
      map['date_agenda_note'] = Variable<DateTime?>(date_agenda_note);
    }
    if (!nullToAbsent || send != null) {
      map['send'] = Variable<bool?>(send);
    }
    return map;
  }

  AddNotesCompanion toCompanion(bool nullToAbsent) {
    return AddNotesCompanion(
      id_agenda_note: Value(id_agenda_note),
      id_agenda: Value(id_agenda),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
      note: Value(note),
      id_agenda_statut: id_agenda_statut == null && nullToAbsent
          ? const Value.absent()
          : Value(id_agenda_statut),
      date_agenda_note: date_agenda_note == null && nullToAbsent
          ? const Value.absent()
          : Value(date_agenda_note),
      send: send == null && nullToAbsent ? const Value.absent() : Value(send),
    );
  }

  factory AddNote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AddNote(
      id_agenda_note: serializer.fromJson<int>(json['id_agenda_note']),
      id_agenda: serializer.fromJson<int>(json['id_agenda']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
      note: serializer.fromJson<String>(json['note']),
      id_agenda_statut: serializer.fromJson<int?>(json['id_agenda_statut']),
      date_agenda_note:
          serializer.fromJson<DateTime?>(json['date_agenda_note']),
      send: serializer.fromJson<bool?>(json['send']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_agenda_note': serializer.toJson<int>(id_agenda_note),
      'id_agenda': serializer.toJson<int>(id_agenda),
      'id_personne': serializer.toJson<int?>(id_personne),
      'note': serializer.toJson<String>(note),
      'id_agenda_statut': serializer.toJson<int?>(id_agenda_statut),
      'date_agenda_note': serializer.toJson<DateTime?>(date_agenda_note),
      'send': serializer.toJson<bool?>(send),
    };
  }

  AddNote copyWith(
          {int? id_agenda_note,
          int? id_agenda,
          int? id_personne,
          String? note,
          int? id_agenda_statut,
          DateTime? date_agenda_note,
          bool? send}) =>
      AddNote(
        id_agenda_note: id_agenda_note ?? this.id_agenda_note,
        id_agenda: id_agenda ?? this.id_agenda,
        id_personne: id_personne ?? this.id_personne,
        note: note ?? this.note,
        id_agenda_statut: id_agenda_statut ?? this.id_agenda_statut,
        date_agenda_note: date_agenda_note ?? this.date_agenda_note,
        send: send ?? this.send,
      );
  @override
  String toString() {
    return (StringBuffer('AddNote(')
          ..write('id_agenda_note: $id_agenda_note, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('id_personne: $id_personne, ')
          ..write('note: $note, ')
          ..write('id_agenda_statut: $id_agenda_statut, ')
          ..write('date_agenda_note: $date_agenda_note, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_agenda_note, id_agenda, id_personne, note,
      id_agenda_statut, date_agenda_note, send);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddNote &&
          other.id_agenda_note == this.id_agenda_note &&
          other.id_agenda == this.id_agenda &&
          other.id_personne == this.id_personne &&
          other.note == this.note &&
          other.id_agenda_statut == this.id_agenda_statut &&
          other.date_agenda_note == this.date_agenda_note &&
          other.send == this.send);
}

class AddNotesCompanion extends UpdateCompanion<AddNote> {
  final Value<int> id_agenda_note;
  final Value<int> id_agenda;
  final Value<int?> id_personne;
  final Value<String> note;
  final Value<int?> id_agenda_statut;
  final Value<DateTime?> date_agenda_note;
  final Value<bool?> send;
  const AddNotesCompanion({
    this.id_agenda_note = const Value.absent(),
    this.id_agenda = const Value.absent(),
    this.id_personne = const Value.absent(),
    this.note = const Value.absent(),
    this.id_agenda_statut = const Value.absent(),
    this.date_agenda_note = const Value.absent(),
    this.send = const Value.absent(),
  });
  AddNotesCompanion.insert({
    this.id_agenda_note = const Value.absent(),
    required int id_agenda,
    this.id_personne = const Value.absent(),
    required String note,
    this.id_agenda_statut = const Value.absent(),
    this.date_agenda_note = const Value.absent(),
    this.send = const Value.absent(),
  })  : id_agenda = Value(id_agenda),
        note = Value(note);
  static Insertable<AddNote> custom({
    Expression<int>? id_agenda_note,
    Expression<int>? id_agenda,
    Expression<int?>? id_personne,
    Expression<String>? note,
    Expression<int?>? id_agenda_statut,
    Expression<DateTime?>? date_agenda_note,
    Expression<bool?>? send,
  }) {
    return RawValuesInsertable({
      if (id_agenda_note != null) 'id_agenda_note': id_agenda_note,
      if (id_agenda != null) 'id_agenda': id_agenda,
      if (id_personne != null) 'id_personne': id_personne,
      if (note != null) 'note': note,
      if (id_agenda_statut != null) 'id_agenda_statut': id_agenda_statut,
      if (date_agenda_note != null) 'date_agenda_note': date_agenda_note,
      if (send != null) 'send': send,
    });
  }

  AddNotesCompanion copyWith(
      {Value<int>? id_agenda_note,
      Value<int>? id_agenda,
      Value<int?>? id_personne,
      Value<String>? note,
      Value<int?>? id_agenda_statut,
      Value<DateTime?>? date_agenda_note,
      Value<bool?>? send}) {
    return AddNotesCompanion(
      id_agenda_note: id_agenda_note ?? this.id_agenda_note,
      id_agenda: id_agenda ?? this.id_agenda,
      id_personne: id_personne ?? this.id_personne,
      note: note ?? this.note,
      id_agenda_statut: id_agenda_statut ?? this.id_agenda_statut,
      date_agenda_note: date_agenda_note ?? this.date_agenda_note,
      send: send ?? this.send,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_agenda_note.present) {
      map['id_agenda_note'] = Variable<int>(id_agenda_note.value);
    }
    if (id_agenda.present) {
      map['id_agenda'] = Variable<int>(id_agenda.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (id_agenda_statut.present) {
      map['id_agenda_statut'] = Variable<int?>(id_agenda_statut.value);
    }
    if (date_agenda_note.present) {
      map['date_agenda_note'] = Variable<DateTime?>(date_agenda_note.value);
    }
    if (send.present) {
      map['send'] = Variable<bool?>(send.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddNotesCompanion(')
          ..write('id_agenda_note: $id_agenda_note, ')
          ..write('id_agenda: $id_agenda, ')
          ..write('id_personne: $id_personne, ')
          ..write('note: $note, ')
          ..write('id_agenda_statut: $id_agenda_statut, ')
          ..write('date_agenda_note: $date_agenda_note, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }
}

class $AddNotesTable extends AddNotes with TableInfo<$AddNotesTable, AddNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddNotesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_agenda_noteMeta =
      const VerificationMeta('id_agenda_note');
  @override
  late final GeneratedColumn<int?> id_agenda_note = GeneratedColumn<int?>(
      'id_agenda_note', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_agendaMeta = const VerificationMeta('id_agenda');
  @override
  late final GeneratedColumn<int?> id_agenda = GeneratedColumn<int?>(
      'id_agenda', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String?> note = GeneratedColumn<String?>(
      'note', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _id_agenda_statutMeta =
      const VerificationMeta('id_agenda_statut');
  @override
  late final GeneratedColumn<int?> id_agenda_statut = GeneratedColumn<int?>(
      'id_agenda_statut', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _date_agenda_noteMeta =
      const VerificationMeta('date_agenda_note');
  @override
  late final GeneratedColumn<DateTime?> date_agenda_note =
      GeneratedColumn<DateTime?>('date_agenda_note', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _sendMeta = const VerificationMeta('send');
  @override
  late final GeneratedColumn<bool?> send = GeneratedColumn<bool?>(
      'send', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (send IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id_agenda_note,
        id_agenda,
        id_personne,
        note,
        id_agenda_statut,
        date_agenda_note,
        send
      ];
  @override
  String get aliasedName => _alias ?? 'add_notes';
  @override
  String get actualTableName => 'add_notes';
  @override
  VerificationContext validateIntegrity(Insertable<AddNote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_agenda_note')) {
      context.handle(
          _id_agenda_noteMeta,
          id_agenda_note.isAcceptableOrUnknown(
              data['id_agenda_note']!, _id_agenda_noteMeta));
    }
    if (data.containsKey('id_agenda')) {
      context.handle(_id_agendaMeta,
          id_agenda.isAcceptableOrUnknown(data['id_agenda']!, _id_agendaMeta));
    } else if (isInserting) {
      context.missing(_id_agendaMeta);
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('id_agenda_statut')) {
      context.handle(
          _id_agenda_statutMeta,
          id_agenda_statut.isAcceptableOrUnknown(
              data['id_agenda_statut']!, _id_agenda_statutMeta));
    }
    if (data.containsKey('date_agenda_note')) {
      context.handle(
          _date_agenda_noteMeta,
          date_agenda_note.isAcceptableOrUnknown(
              data['date_agenda_note']!, _date_agenda_noteMeta));
    }
    if (data.containsKey('send')) {
      context.handle(
          _sendMeta, send.isAcceptableOrUnknown(data['send']!, _sendMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_agenda_note};
  @override
  AddNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AddNote.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AddNotesTable createAlias(String alias) {
    return $AddNotesTable(attachedDatabase, alias);
  }
}

class AgendaDate extends DataClass implements Insertable<AgendaDate> {
  final int id;
  final DateTime? date_agenda;
  final bool has_photo;
  final int nbr_photo;
  AgendaDate(
      {required this.id,
      this.date_agenda,
      required this.has_photo,
      required this.nbr_photo});
  factory AgendaDate.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AgendaDate(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date_agenda: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_agenda']),
      has_photo: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}has_photo'])!,
      nbr_photo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nbr_photo'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date_agenda != null) {
      map['date_agenda'] = Variable<DateTime?>(date_agenda);
    }
    map['has_photo'] = Variable<bool>(has_photo);
    map['nbr_photo'] = Variable<int>(nbr_photo);
    return map;
  }

  AgendaDatesCompanion toCompanion(bool nullToAbsent) {
    return AgendaDatesCompanion(
      id: Value(id),
      date_agenda: date_agenda == null && nullToAbsent
          ? const Value.absent()
          : Value(date_agenda),
      has_photo: Value(has_photo),
      nbr_photo: Value(nbr_photo),
    );
  }

  factory AgendaDate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AgendaDate(
      id: serializer.fromJson<int>(json['id']),
      date_agenda: serializer.fromJson<DateTime?>(json['date_agenda']),
      has_photo: serializer.fromJson<bool>(json['has_photo']),
      nbr_photo: serializer.fromJson<int>(json['nbr_photo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date_agenda': serializer.toJson<DateTime?>(date_agenda),
      'has_photo': serializer.toJson<bool>(has_photo),
      'nbr_photo': serializer.toJson<int>(nbr_photo),
    };
  }

  AgendaDate copyWith(
          {int? id, DateTime? date_agenda, bool? has_photo, int? nbr_photo}) =>
      AgendaDate(
        id: id ?? this.id,
        date_agenda: date_agenda ?? this.date_agenda,
        has_photo: has_photo ?? this.has_photo,
        nbr_photo: nbr_photo ?? this.nbr_photo,
      );
  @override
  String toString() {
    return (StringBuffer('AgendaDate(')
          ..write('id: $id, ')
          ..write('date_agenda: $date_agenda, ')
          ..write('has_photo: $has_photo, ')
          ..write('nbr_photo: $nbr_photo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date_agenda, has_photo, nbr_photo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgendaDate &&
          other.id == this.id &&
          other.date_agenda == this.date_agenda &&
          other.has_photo == this.has_photo &&
          other.nbr_photo == this.nbr_photo);
}

class AgendaDatesCompanion extends UpdateCompanion<AgendaDate> {
  final Value<int> id;
  final Value<DateTime?> date_agenda;
  final Value<bool> has_photo;
  final Value<int> nbr_photo;
  const AgendaDatesCompanion({
    this.id = const Value.absent(),
    this.date_agenda = const Value.absent(),
    this.has_photo = const Value.absent(),
    this.nbr_photo = const Value.absent(),
  });
  AgendaDatesCompanion.insert({
    this.id = const Value.absent(),
    this.date_agenda = const Value.absent(),
    this.has_photo = const Value.absent(),
    this.nbr_photo = const Value.absent(),
  });
  static Insertable<AgendaDate> custom({
    Expression<int>? id,
    Expression<DateTime?>? date_agenda,
    Expression<bool>? has_photo,
    Expression<int>? nbr_photo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date_agenda != null) 'date_agenda': date_agenda,
      if (has_photo != null) 'has_photo': has_photo,
      if (nbr_photo != null) 'nbr_photo': nbr_photo,
    });
  }

  AgendaDatesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime?>? date_agenda,
      Value<bool>? has_photo,
      Value<int>? nbr_photo}) {
    return AgendaDatesCompanion(
      id: id ?? this.id,
      date_agenda: date_agenda ?? this.date_agenda,
      has_photo: has_photo ?? this.has_photo,
      nbr_photo: nbr_photo ?? this.nbr_photo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date_agenda.present) {
      map['date_agenda'] = Variable<DateTime?>(date_agenda.value);
    }
    if (has_photo.present) {
      map['has_photo'] = Variable<bool>(has_photo.value);
    }
    if (nbr_photo.present) {
      map['nbr_photo'] = Variable<int>(nbr_photo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgendaDatesCompanion(')
          ..write('id: $id, ')
          ..write('date_agenda: $date_agenda, ')
          ..write('has_photo: $has_photo, ')
          ..write('nbr_photo: $nbr_photo')
          ..write(')'))
        .toString();
  }
}

class $AgendaDatesTable extends AgendaDates
    with TableInfo<$AgendaDatesTable, AgendaDate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgendaDatesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _date_agendaMeta =
      const VerificationMeta('date_agenda');
  @override
  late final GeneratedColumn<DateTime?> date_agenda =
      GeneratedColumn<DateTime?>('date_agenda', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _has_photoMeta = const VerificationMeta('has_photo');
  @override
  late final GeneratedColumn<bool?> has_photo = GeneratedColumn<bool?>(
      'has_photo', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (has_photo IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _nbr_photoMeta = const VerificationMeta('nbr_photo');
  @override
  late final GeneratedColumn<int?> nbr_photo = GeneratedColumn<int?>(
      'nbr_photo', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, date_agenda, has_photo, nbr_photo];
  @override
  String get aliasedName => _alias ?? 'agenda_dates';
  @override
  String get actualTableName => 'agenda_dates';
  @override
  VerificationContext validateIntegrity(Insertable<AgendaDate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_agenda')) {
      context.handle(
          _date_agendaMeta,
          date_agenda.isAcceptableOrUnknown(
              data['date_agenda']!, _date_agendaMeta));
    }
    if (data.containsKey('has_photo')) {
      context.handle(_has_photoMeta,
          has_photo.isAcceptableOrUnknown(data['has_photo']!, _has_photoMeta));
    }
    if (data.containsKey('nbr_photo')) {
      context.handle(_nbr_photoMeta,
          nbr_photo.isAcceptableOrUnknown(data['nbr_photo']!, _nbr_photoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AgendaDate map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AgendaDate.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AgendaDatesTable createAlias(String alias) {
    return $AgendaDatesTable(attachedDatabase, alias);
  }
}

class EleveAttestationScolaire extends DataClass
    implements Insertable<EleveAttestationScolaire> {
  final int id_eleve_attestation_scolaire;
  final int id_personne_parent;
  final int id_personne_eleve;
  final DateTime? date_de_la_demande;
  final DateTime? date_de_la_reception;
  final int nombre_de_copies;
  final int idstatut;
  final String? statut;
  EleveAttestationScolaire(
      {required this.id_eleve_attestation_scolaire,
      required this.id_personne_parent,
      required this.id_personne_eleve,
      this.date_de_la_demande,
      this.date_de_la_reception,
      required this.nombre_de_copies,
      required this.idstatut,
      this.statut});
  factory EleveAttestationScolaire.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return EleveAttestationScolaire(
      id_eleve_attestation_scolaire: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_eleve_attestation_scolaire'])!,
      id_personne_parent: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_personne_parent'])!,
      id_personne_eleve: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_personne_eleve'])!,
      date_de_la_demande: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_de_la_demande']),
      date_de_la_reception: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_de_la_reception']),
      nombre_de_copies: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_de_copies'])!,
      idstatut: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idstatut'])!,
      statut: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statut']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_eleve_attestation_scolaire'] =
        Variable<int>(id_eleve_attestation_scolaire);
    map['id_personne_parent'] = Variable<int>(id_personne_parent);
    map['id_personne_eleve'] = Variable<int>(id_personne_eleve);
    if (!nullToAbsent || date_de_la_demande != null) {
      map['date_de_la_demande'] = Variable<DateTime?>(date_de_la_demande);
    }
    if (!nullToAbsent || date_de_la_reception != null) {
      map['date_de_la_reception'] = Variable<DateTime?>(date_de_la_reception);
    }
    map['nombre_de_copies'] = Variable<int>(nombre_de_copies);
    map['idstatut'] = Variable<int>(idstatut);
    if (!nullToAbsent || statut != null) {
      map['statut'] = Variable<String?>(statut);
    }
    return map;
  }

  EleveAttestationScolairesCompanion toCompanion(bool nullToAbsent) {
    return EleveAttestationScolairesCompanion(
      id_eleve_attestation_scolaire: Value(id_eleve_attestation_scolaire),
      id_personne_parent: Value(id_personne_parent),
      id_personne_eleve: Value(id_personne_eleve),
      date_de_la_demande: date_de_la_demande == null && nullToAbsent
          ? const Value.absent()
          : Value(date_de_la_demande),
      date_de_la_reception: date_de_la_reception == null && nullToAbsent
          ? const Value.absent()
          : Value(date_de_la_reception),
      nombre_de_copies: Value(nombre_de_copies),
      idstatut: Value(idstatut),
      statut:
          statut == null && nullToAbsent ? const Value.absent() : Value(statut),
    );
  }

  factory EleveAttestationScolaire.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EleveAttestationScolaire(
      id_eleve_attestation_scolaire:
          serializer.fromJson<int>(json['id_eleve_attestation_scolaire']),
      id_personne_parent: serializer.fromJson<int>(json['id_personne_parent']),
      id_personne_eleve: serializer.fromJson<int>(json['id_personne_eleve']),
      date_de_la_demande:
          serializer.fromJson<DateTime?>(json['date_de_la_demande']),
      date_de_la_reception:
          serializer.fromJson<DateTime?>(json['date_de_la_reception']),
      nombre_de_copies: serializer.fromJson<int>(json['nombre_de_copies']),
      idstatut: serializer.fromJson<int>(json['idstatut']),
      statut: serializer.fromJson<String?>(json['statut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_eleve_attestation_scolaire':
          serializer.toJson<int>(id_eleve_attestation_scolaire),
      'id_personne_parent': serializer.toJson<int>(id_personne_parent),
      'id_personne_eleve': serializer.toJson<int>(id_personne_eleve),
      'date_de_la_demande': serializer.toJson<DateTime?>(date_de_la_demande),
      'date_de_la_reception':
          serializer.toJson<DateTime?>(date_de_la_reception),
      'nombre_de_copies': serializer.toJson<int>(nombre_de_copies),
      'idstatut': serializer.toJson<int>(idstatut),
      'statut': serializer.toJson<String?>(statut),
    };
  }

  EleveAttestationScolaire copyWith(
          {int? id_eleve_attestation_scolaire,
          int? id_personne_parent,
          int? id_personne_eleve,
          DateTime? date_de_la_demande,
          DateTime? date_de_la_reception,
          int? nombre_de_copies,
          int? idstatut,
          String? statut}) =>
      EleveAttestationScolaire(
        id_eleve_attestation_scolaire:
            id_eleve_attestation_scolaire ?? this.id_eleve_attestation_scolaire,
        id_personne_parent: id_personne_parent ?? this.id_personne_parent,
        id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
        date_de_la_demande: date_de_la_demande ?? this.date_de_la_demande,
        date_de_la_reception: date_de_la_reception ?? this.date_de_la_reception,
        nombre_de_copies: nombre_de_copies ?? this.nombre_de_copies,
        idstatut: idstatut ?? this.idstatut,
        statut: statut ?? this.statut,
      );
  @override
  String toString() {
    return (StringBuffer('EleveAttestationScolaire(')
          ..write(
              'id_eleve_attestation_scolaire: $id_eleve_attestation_scolaire, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('date_de_la_demande: $date_de_la_demande, ')
          ..write('date_de_la_reception: $date_de_la_reception, ')
          ..write('nombre_de_copies: $nombre_de_copies, ')
          ..write('idstatut: $idstatut, ')
          ..write('statut: $statut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_eleve_attestation_scolaire,
      id_personne_parent,
      id_personne_eleve,
      date_de_la_demande,
      date_de_la_reception,
      nombre_de_copies,
      idstatut,
      statut);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EleveAttestationScolaire &&
          other.id_eleve_attestation_scolaire ==
              this.id_eleve_attestation_scolaire &&
          other.id_personne_parent == this.id_personne_parent &&
          other.id_personne_eleve == this.id_personne_eleve &&
          other.date_de_la_demande == this.date_de_la_demande &&
          other.date_de_la_reception == this.date_de_la_reception &&
          other.nombre_de_copies == this.nombre_de_copies &&
          other.idstatut == this.idstatut &&
          other.statut == this.statut);
}

class EleveAttestationScolairesCompanion
    extends UpdateCompanion<EleveAttestationScolaire> {
  final Value<int> id_eleve_attestation_scolaire;
  final Value<int> id_personne_parent;
  final Value<int> id_personne_eleve;
  final Value<DateTime?> date_de_la_demande;
  final Value<DateTime?> date_de_la_reception;
  final Value<int> nombre_de_copies;
  final Value<int> idstatut;
  final Value<String?> statut;
  const EleveAttestationScolairesCompanion({
    this.id_eleve_attestation_scolaire = const Value.absent(),
    this.id_personne_parent = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.date_de_la_demande = const Value.absent(),
    this.date_de_la_reception = const Value.absent(),
    this.nombre_de_copies = const Value.absent(),
    this.idstatut = const Value.absent(),
    this.statut = const Value.absent(),
  });
  EleveAttestationScolairesCompanion.insert({
    this.id_eleve_attestation_scolaire = const Value.absent(),
    required int id_personne_parent,
    required int id_personne_eleve,
    this.date_de_la_demande = const Value.absent(),
    this.date_de_la_reception = const Value.absent(),
    required int nombre_de_copies,
    this.idstatut = const Value.absent(),
    this.statut = const Value.absent(),
  })  : id_personne_parent = Value(id_personne_parent),
        id_personne_eleve = Value(id_personne_eleve),
        nombre_de_copies = Value(nombre_de_copies);
  static Insertable<EleveAttestationScolaire> custom({
    Expression<int>? id_eleve_attestation_scolaire,
    Expression<int>? id_personne_parent,
    Expression<int>? id_personne_eleve,
    Expression<DateTime?>? date_de_la_demande,
    Expression<DateTime?>? date_de_la_reception,
    Expression<int>? nombre_de_copies,
    Expression<int>? idstatut,
    Expression<String?>? statut,
  }) {
    return RawValuesInsertable({
      if (id_eleve_attestation_scolaire != null)
        'id_eleve_attestation_scolaire': id_eleve_attestation_scolaire,
      if (id_personne_parent != null) 'id_personne_parent': id_personne_parent,
      if (id_personne_eleve != null) 'id_personne_eleve': id_personne_eleve,
      if (date_de_la_demande != null) 'date_de_la_demande': date_de_la_demande,
      if (date_de_la_reception != null)
        'date_de_la_reception': date_de_la_reception,
      if (nombre_de_copies != null) 'nombre_de_copies': nombre_de_copies,
      if (idstatut != null) 'idstatut': idstatut,
      if (statut != null) 'statut': statut,
    });
  }

  EleveAttestationScolairesCompanion copyWith(
      {Value<int>? id_eleve_attestation_scolaire,
      Value<int>? id_personne_parent,
      Value<int>? id_personne_eleve,
      Value<DateTime?>? date_de_la_demande,
      Value<DateTime?>? date_de_la_reception,
      Value<int>? nombre_de_copies,
      Value<int>? idstatut,
      Value<String?>? statut}) {
    return EleveAttestationScolairesCompanion(
      id_eleve_attestation_scolaire:
          id_eleve_attestation_scolaire ?? this.id_eleve_attestation_scolaire,
      id_personne_parent: id_personne_parent ?? this.id_personne_parent,
      id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
      date_de_la_demande: date_de_la_demande ?? this.date_de_la_demande,
      date_de_la_reception: date_de_la_reception ?? this.date_de_la_reception,
      nombre_de_copies: nombre_de_copies ?? this.nombre_de_copies,
      idstatut: idstatut ?? this.idstatut,
      statut: statut ?? this.statut,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_eleve_attestation_scolaire.present) {
      map['id_eleve_attestation_scolaire'] =
          Variable<int>(id_eleve_attestation_scolaire.value);
    }
    if (id_personne_parent.present) {
      map['id_personne_parent'] = Variable<int>(id_personne_parent.value);
    }
    if (id_personne_eleve.present) {
      map['id_personne_eleve'] = Variable<int>(id_personne_eleve.value);
    }
    if (date_de_la_demande.present) {
      map['date_de_la_demande'] = Variable<DateTime?>(date_de_la_demande.value);
    }
    if (date_de_la_reception.present) {
      map['date_de_la_reception'] =
          Variable<DateTime?>(date_de_la_reception.value);
    }
    if (nombre_de_copies.present) {
      map['nombre_de_copies'] = Variable<int>(nombre_de_copies.value);
    }
    if (idstatut.present) {
      map['idstatut'] = Variable<int>(idstatut.value);
    }
    if (statut.present) {
      map['statut'] = Variable<String?>(statut.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EleveAttestationScolairesCompanion(')
          ..write(
              'id_eleve_attestation_scolaire: $id_eleve_attestation_scolaire, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('date_de_la_demande: $date_de_la_demande, ')
          ..write('date_de_la_reception: $date_de_la_reception, ')
          ..write('nombre_de_copies: $nombre_de_copies, ')
          ..write('idstatut: $idstatut, ')
          ..write('statut: $statut')
          ..write(')'))
        .toString();
  }
}

class $EleveAttestationScolairesTable extends EleveAttestationScolaires
    with TableInfo<$EleveAttestationScolairesTable, EleveAttestationScolaire> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EleveAttestationScolairesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_eleve_attestation_scolaireMeta =
      const VerificationMeta('id_eleve_attestation_scolaire');
  @override
  late final GeneratedColumn<int?> id_eleve_attestation_scolaire =
      GeneratedColumn<int?>('id_eleve_attestation_scolaire', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_parentMeta =
      const VerificationMeta('id_personne_parent');
  @override
  late final GeneratedColumn<int?> id_personne_parent = GeneratedColumn<int?>(
      'id_personne_parent', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _id_personne_eleveMeta =
      const VerificationMeta('id_personne_eleve');
  @override
  late final GeneratedColumn<int?> id_personne_eleve = GeneratedColumn<int?>(
      'id_personne_eleve', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _date_de_la_demandeMeta =
      const VerificationMeta('date_de_la_demande');
  @override
  late final GeneratedColumn<DateTime?> date_de_la_demande =
      GeneratedColumn<DateTime?>('date_de_la_demande', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _date_de_la_receptionMeta =
      const VerificationMeta('date_de_la_reception');
  @override
  late final GeneratedColumn<DateTime?> date_de_la_reception =
      GeneratedColumn<DateTime?>('date_de_la_reception', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nombre_de_copiesMeta =
      const VerificationMeta('nombre_de_copies');
  @override
  late final GeneratedColumn<int?> nombre_de_copies = GeneratedColumn<int?>(
      'nombre_de_copies', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idstatutMeta = const VerificationMeta('idstatut');
  @override
  late final GeneratedColumn<int?> idstatut = GeneratedColumn<int?>(
      'idstatut', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _statutMeta = const VerificationMeta('statut');
  @override
  late final GeneratedColumn<String?> statut = GeneratedColumn<String?>(
      'statut', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_eleve_attestation_scolaire,
        id_personne_parent,
        id_personne_eleve,
        date_de_la_demande,
        date_de_la_reception,
        nombre_de_copies,
        idstatut,
        statut
      ];
  @override
  String get aliasedName => _alias ?? 'eleve_attestation_scolaires';
  @override
  String get actualTableName => 'eleve_attestation_scolaires';
  @override
  VerificationContext validateIntegrity(
      Insertable<EleveAttestationScolaire> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_eleve_attestation_scolaire')) {
      context.handle(
          _id_eleve_attestation_scolaireMeta,
          id_eleve_attestation_scolaire.isAcceptableOrUnknown(
              data['id_eleve_attestation_scolaire']!,
              _id_eleve_attestation_scolaireMeta));
    }
    if (data.containsKey('id_personne_parent')) {
      context.handle(
          _id_personne_parentMeta,
          id_personne_parent.isAcceptableOrUnknown(
              data['id_personne_parent']!, _id_personne_parentMeta));
    } else if (isInserting) {
      context.missing(_id_personne_parentMeta);
    }
    if (data.containsKey('id_personne_eleve')) {
      context.handle(
          _id_personne_eleveMeta,
          id_personne_eleve.isAcceptableOrUnknown(
              data['id_personne_eleve']!, _id_personne_eleveMeta));
    } else if (isInserting) {
      context.missing(_id_personne_eleveMeta);
    }
    if (data.containsKey('date_de_la_demande')) {
      context.handle(
          _date_de_la_demandeMeta,
          date_de_la_demande.isAcceptableOrUnknown(
              data['date_de_la_demande']!, _date_de_la_demandeMeta));
    }
    if (data.containsKey('date_de_la_reception')) {
      context.handle(
          _date_de_la_receptionMeta,
          date_de_la_reception.isAcceptableOrUnknown(
              data['date_de_la_reception']!, _date_de_la_receptionMeta));
    }
    if (data.containsKey('nombre_de_copies')) {
      context.handle(
          _nombre_de_copiesMeta,
          nombre_de_copies.isAcceptableOrUnknown(
              data['nombre_de_copies']!, _nombre_de_copiesMeta));
    } else if (isInserting) {
      context.missing(_nombre_de_copiesMeta);
    }
    if (data.containsKey('idstatut')) {
      context.handle(_idstatutMeta,
          idstatut.isAcceptableOrUnknown(data['idstatut']!, _idstatutMeta));
    }
    if (data.containsKey('statut')) {
      context.handle(_statutMeta,
          statut.isAcceptableOrUnknown(data['statut']!, _statutMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_eleve_attestation_scolaire};
  @override
  EleveAttestationScolaire map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return EleveAttestationScolaire.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EleveAttestationScolairesTable createAlias(String alias) {
    return $EleveAttestationScolairesTable(attachedDatabase, alias);
  }
}

class DemandesAttestation extends DataClass
    implements Insertable<DemandesAttestation> {
  final int id_eleve_attestation_scolaire;
  final int? id_personne_parent;
  final int id_personne_eleve;
  final DateTime date_de_la_demande;
  final DateTime? date_de_la_reception;
  final int nombre_de_copies;
  final int idstatut;
  final String? statut;
  final String? parentnom;
  final bool? remove;
  final bool? send;
  DemandesAttestation(
      {required this.id_eleve_attestation_scolaire,
      this.id_personne_parent,
      required this.id_personne_eleve,
      required this.date_de_la_demande,
      this.date_de_la_reception,
      required this.nombre_de_copies,
      required this.idstatut,
      this.statut,
      this.parentnom,
      this.remove,
      this.send});
  factory DemandesAttestation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DemandesAttestation(
      id_eleve_attestation_scolaire: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_eleve_attestation_scolaire'])!,
      id_personne_parent: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_personne_parent']),
      id_personne_eleve: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_personne_eleve'])!,
      date_de_la_demande: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_de_la_demande'])!,
      date_de_la_reception: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_de_la_reception']),
      nombre_de_copies: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_de_copies'])!,
      idstatut: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idstatut'])!,
      statut: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statut']),
      parentnom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parentnom']),
      remove: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remove']),
      send: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}send']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_eleve_attestation_scolaire'] =
        Variable<int>(id_eleve_attestation_scolaire);
    if (!nullToAbsent || id_personne_parent != null) {
      map['id_personne_parent'] = Variable<int?>(id_personne_parent);
    }
    map['id_personne_eleve'] = Variable<int>(id_personne_eleve);
    map['date_de_la_demande'] = Variable<DateTime>(date_de_la_demande);
    if (!nullToAbsent || date_de_la_reception != null) {
      map['date_de_la_reception'] = Variable<DateTime?>(date_de_la_reception);
    }
    map['nombre_de_copies'] = Variable<int>(nombre_de_copies);
    map['idstatut'] = Variable<int>(idstatut);
    if (!nullToAbsent || statut != null) {
      map['statut'] = Variable<String?>(statut);
    }
    if (!nullToAbsent || parentnom != null) {
      map['parentnom'] = Variable<String?>(parentnom);
    }
    if (!nullToAbsent || remove != null) {
      map['remove'] = Variable<bool?>(remove);
    }
    if (!nullToAbsent || send != null) {
      map['send'] = Variable<bool?>(send);
    }
    return map;
  }

  DemandesAttestationsCompanion toCompanion(bool nullToAbsent) {
    return DemandesAttestationsCompanion(
      id_eleve_attestation_scolaire: Value(id_eleve_attestation_scolaire),
      id_personne_parent: id_personne_parent == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne_parent),
      id_personne_eleve: Value(id_personne_eleve),
      date_de_la_demande: Value(date_de_la_demande),
      date_de_la_reception: date_de_la_reception == null && nullToAbsent
          ? const Value.absent()
          : Value(date_de_la_reception),
      nombre_de_copies: Value(nombre_de_copies),
      idstatut: Value(idstatut),
      statut:
          statut == null && nullToAbsent ? const Value.absent() : Value(statut),
      parentnom: parentnom == null && nullToAbsent
          ? const Value.absent()
          : Value(parentnom),
      remove:
          remove == null && nullToAbsent ? const Value.absent() : Value(remove),
      send: send == null && nullToAbsent ? const Value.absent() : Value(send),
    );
  }

  factory DemandesAttestation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DemandesAttestation(
      id_eleve_attestation_scolaire:
          serializer.fromJson<int>(json['id_eleve_attestation_scolaire']),
      id_personne_parent: serializer.fromJson<int?>(json['id_personne_parent']),
      id_personne_eleve: serializer.fromJson<int>(json['id_personne_eleve']),
      date_de_la_demande:
          serializer.fromJson<DateTime>(json['date_de_la_demande']),
      date_de_la_reception:
          serializer.fromJson<DateTime?>(json['date_de_la_reception']),
      nombre_de_copies: serializer.fromJson<int>(json['nombre_de_copies']),
      idstatut: serializer.fromJson<int>(json['idstatut']),
      statut: serializer.fromJson<String?>(json['statut']),
      parentnom: serializer.fromJson<String?>(json['parentnom']),
      remove: serializer.fromJson<bool?>(json['remove']),
      send: serializer.fromJson<bool?>(json['send']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_eleve_attestation_scolaire':
          serializer.toJson<int>(id_eleve_attestation_scolaire),
      'id_personne_parent': serializer.toJson<int?>(id_personne_parent),
      'id_personne_eleve': serializer.toJson<int>(id_personne_eleve),
      'date_de_la_demande': serializer.toJson<DateTime>(date_de_la_demande),
      'date_de_la_reception':
          serializer.toJson<DateTime?>(date_de_la_reception),
      'nombre_de_copies': serializer.toJson<int>(nombre_de_copies),
      'idstatut': serializer.toJson<int>(idstatut),
      'statut': serializer.toJson<String?>(statut),
      'parentnom': serializer.toJson<String?>(parentnom),
      'remove': serializer.toJson<bool?>(remove),
      'send': serializer.toJson<bool?>(send),
    };
  }

  DemandesAttestation copyWith(
          {int? id_eleve_attestation_scolaire,
          int? id_personne_parent,
          int? id_personne_eleve,
          DateTime? date_de_la_demande,
          DateTime? date_de_la_reception,
          int? nombre_de_copies,
          int? idstatut,
          String? statut,
          String? parentnom,
          bool? remove,
          bool? send}) =>
      DemandesAttestation(
        id_eleve_attestation_scolaire:
            id_eleve_attestation_scolaire ?? this.id_eleve_attestation_scolaire,
        id_personne_parent: id_personne_parent ?? this.id_personne_parent,
        id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
        date_de_la_demande: date_de_la_demande ?? this.date_de_la_demande,
        date_de_la_reception: date_de_la_reception ?? this.date_de_la_reception,
        nombre_de_copies: nombre_de_copies ?? this.nombre_de_copies,
        idstatut: idstatut ?? this.idstatut,
        statut: statut ?? this.statut,
        parentnom: parentnom ?? this.parentnom,
        remove: remove ?? this.remove,
        send: send ?? this.send,
      );
  @override
  String toString() {
    return (StringBuffer('DemandesAttestation(')
          ..write(
              'id_eleve_attestation_scolaire: $id_eleve_attestation_scolaire, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('date_de_la_demande: $date_de_la_demande, ')
          ..write('date_de_la_reception: $date_de_la_reception, ')
          ..write('nombre_de_copies: $nombre_de_copies, ')
          ..write('idstatut: $idstatut, ')
          ..write('statut: $statut, ')
          ..write('parentnom: $parentnom, ')
          ..write('remove: $remove, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_eleve_attestation_scolaire,
      id_personne_parent,
      id_personne_eleve,
      date_de_la_demande,
      date_de_la_reception,
      nombre_de_copies,
      idstatut,
      statut,
      parentnom,
      remove,
      send);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DemandesAttestation &&
          other.id_eleve_attestation_scolaire ==
              this.id_eleve_attestation_scolaire &&
          other.id_personne_parent == this.id_personne_parent &&
          other.id_personne_eleve == this.id_personne_eleve &&
          other.date_de_la_demande == this.date_de_la_demande &&
          other.date_de_la_reception == this.date_de_la_reception &&
          other.nombre_de_copies == this.nombre_de_copies &&
          other.idstatut == this.idstatut &&
          other.statut == this.statut &&
          other.parentnom == this.parentnom &&
          other.remove == this.remove &&
          other.send == this.send);
}

class DemandesAttestationsCompanion
    extends UpdateCompanion<DemandesAttestation> {
  final Value<int> id_eleve_attestation_scolaire;
  final Value<int?> id_personne_parent;
  final Value<int> id_personne_eleve;
  final Value<DateTime> date_de_la_demande;
  final Value<DateTime?> date_de_la_reception;
  final Value<int> nombre_de_copies;
  final Value<int> idstatut;
  final Value<String?> statut;
  final Value<String?> parentnom;
  final Value<bool?> remove;
  final Value<bool?> send;
  const DemandesAttestationsCompanion({
    this.id_eleve_attestation_scolaire = const Value.absent(),
    this.id_personne_parent = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.date_de_la_demande = const Value.absent(),
    this.date_de_la_reception = const Value.absent(),
    this.nombre_de_copies = const Value.absent(),
    this.idstatut = const Value.absent(),
    this.statut = const Value.absent(),
    this.parentnom = const Value.absent(),
    this.remove = const Value.absent(),
    this.send = const Value.absent(),
  });
  DemandesAttestationsCompanion.insert({
    this.id_eleve_attestation_scolaire = const Value.absent(),
    this.id_personne_parent = const Value.absent(),
    required int id_personne_eleve,
    required DateTime date_de_la_demande,
    this.date_de_la_reception = const Value.absent(),
    required int nombre_de_copies,
    this.idstatut = const Value.absent(),
    this.statut = const Value.absent(),
    this.parentnom = const Value.absent(),
    this.remove = const Value.absent(),
    this.send = const Value.absent(),
  })  : id_personne_eleve = Value(id_personne_eleve),
        date_de_la_demande = Value(date_de_la_demande),
        nombre_de_copies = Value(nombre_de_copies);
  static Insertable<DemandesAttestation> custom({
    Expression<int>? id_eleve_attestation_scolaire,
    Expression<int?>? id_personne_parent,
    Expression<int>? id_personne_eleve,
    Expression<DateTime>? date_de_la_demande,
    Expression<DateTime?>? date_de_la_reception,
    Expression<int>? nombre_de_copies,
    Expression<int>? idstatut,
    Expression<String?>? statut,
    Expression<String?>? parentnom,
    Expression<bool?>? remove,
    Expression<bool?>? send,
  }) {
    return RawValuesInsertable({
      if (id_eleve_attestation_scolaire != null)
        'id_eleve_attestation_scolaire': id_eleve_attestation_scolaire,
      if (id_personne_parent != null) 'id_personne_parent': id_personne_parent,
      if (id_personne_eleve != null) 'id_personne_eleve': id_personne_eleve,
      if (date_de_la_demande != null) 'date_de_la_demande': date_de_la_demande,
      if (date_de_la_reception != null)
        'date_de_la_reception': date_de_la_reception,
      if (nombre_de_copies != null) 'nombre_de_copies': nombre_de_copies,
      if (idstatut != null) 'idstatut': idstatut,
      if (statut != null) 'statut': statut,
      if (parentnom != null) 'parentnom': parentnom,
      if (remove != null) 'remove': remove,
      if (send != null) 'send': send,
    });
  }

  DemandesAttestationsCompanion copyWith(
      {Value<int>? id_eleve_attestation_scolaire,
      Value<int?>? id_personne_parent,
      Value<int>? id_personne_eleve,
      Value<DateTime>? date_de_la_demande,
      Value<DateTime?>? date_de_la_reception,
      Value<int>? nombre_de_copies,
      Value<int>? idstatut,
      Value<String?>? statut,
      Value<String?>? parentnom,
      Value<bool?>? remove,
      Value<bool?>? send}) {
    return DemandesAttestationsCompanion(
      id_eleve_attestation_scolaire:
          id_eleve_attestation_scolaire ?? this.id_eleve_attestation_scolaire,
      id_personne_parent: id_personne_parent ?? this.id_personne_parent,
      id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
      date_de_la_demande: date_de_la_demande ?? this.date_de_la_demande,
      date_de_la_reception: date_de_la_reception ?? this.date_de_la_reception,
      nombre_de_copies: nombre_de_copies ?? this.nombre_de_copies,
      idstatut: idstatut ?? this.idstatut,
      statut: statut ?? this.statut,
      parentnom: parentnom ?? this.parentnom,
      remove: remove ?? this.remove,
      send: send ?? this.send,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_eleve_attestation_scolaire.present) {
      map['id_eleve_attestation_scolaire'] =
          Variable<int>(id_eleve_attestation_scolaire.value);
    }
    if (id_personne_parent.present) {
      map['id_personne_parent'] = Variable<int?>(id_personne_parent.value);
    }
    if (id_personne_eleve.present) {
      map['id_personne_eleve'] = Variable<int>(id_personne_eleve.value);
    }
    if (date_de_la_demande.present) {
      map['date_de_la_demande'] = Variable<DateTime>(date_de_la_demande.value);
    }
    if (date_de_la_reception.present) {
      map['date_de_la_reception'] =
          Variable<DateTime?>(date_de_la_reception.value);
    }
    if (nombre_de_copies.present) {
      map['nombre_de_copies'] = Variable<int>(nombre_de_copies.value);
    }
    if (idstatut.present) {
      map['idstatut'] = Variable<int>(idstatut.value);
    }
    if (statut.present) {
      map['statut'] = Variable<String?>(statut.value);
    }
    if (parentnom.present) {
      map['parentnom'] = Variable<String?>(parentnom.value);
    }
    if (remove.present) {
      map['remove'] = Variable<bool?>(remove.value);
    }
    if (send.present) {
      map['send'] = Variable<bool?>(send.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DemandesAttestationsCompanion(')
          ..write(
              'id_eleve_attestation_scolaire: $id_eleve_attestation_scolaire, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('date_de_la_demande: $date_de_la_demande, ')
          ..write('date_de_la_reception: $date_de_la_reception, ')
          ..write('nombre_de_copies: $nombre_de_copies, ')
          ..write('idstatut: $idstatut, ')
          ..write('statut: $statut, ')
          ..write('parentnom: $parentnom, ')
          ..write('remove: $remove, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }
}

class $DemandesAttestationsTable extends DemandesAttestations
    with TableInfo<$DemandesAttestationsTable, DemandesAttestation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DemandesAttestationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_eleve_attestation_scolaireMeta =
      const VerificationMeta('id_eleve_attestation_scolaire');
  @override
  late final GeneratedColumn<int?> id_eleve_attestation_scolaire =
      GeneratedColumn<int?>('id_eleve_attestation_scolaire', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_parentMeta =
      const VerificationMeta('id_personne_parent');
  @override
  late final GeneratedColumn<int?> id_personne_parent = GeneratedColumn<int?>(
      'id_personne_parent', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_eleveMeta =
      const VerificationMeta('id_personne_eleve');
  @override
  late final GeneratedColumn<int?> id_personne_eleve = GeneratedColumn<int?>(
      'id_personne_eleve', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _date_de_la_demandeMeta =
      const VerificationMeta('date_de_la_demande');
  @override
  late final GeneratedColumn<DateTime?> date_de_la_demande =
      GeneratedColumn<DateTime?>('date_de_la_demande', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _date_de_la_receptionMeta =
      const VerificationMeta('date_de_la_reception');
  @override
  late final GeneratedColumn<DateTime?> date_de_la_reception =
      GeneratedColumn<DateTime?>('date_de_la_reception', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nombre_de_copiesMeta =
      const VerificationMeta('nombre_de_copies');
  @override
  late final GeneratedColumn<int?> nombre_de_copies = GeneratedColumn<int?>(
      'nombre_de_copies', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idstatutMeta = const VerificationMeta('idstatut');
  @override
  late final GeneratedColumn<int?> idstatut = GeneratedColumn<int?>(
      'idstatut', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _statutMeta = const VerificationMeta('statut');
  @override
  late final GeneratedColumn<String?> statut = GeneratedColumn<String?>(
      'statut', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _parentnomMeta = const VerificationMeta('parentnom');
  @override
  late final GeneratedColumn<String?> parentnom = GeneratedColumn<String?>(
      'parentnom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _removeMeta = const VerificationMeta('remove');
  @override
  late final GeneratedColumn<bool?> remove = GeneratedColumn<bool?>(
      'remove', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (remove IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _sendMeta = const VerificationMeta('send');
  @override
  late final GeneratedColumn<bool?> send = GeneratedColumn<bool?>(
      'send', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (send IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id_eleve_attestation_scolaire,
        id_personne_parent,
        id_personne_eleve,
        date_de_la_demande,
        date_de_la_reception,
        nombre_de_copies,
        idstatut,
        statut,
        parentnom,
        remove,
        send
      ];
  @override
  String get aliasedName => _alias ?? 'demandes_attestations';
  @override
  String get actualTableName => 'demandes_attestations';
  @override
  VerificationContext validateIntegrity(
      Insertable<DemandesAttestation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_eleve_attestation_scolaire')) {
      context.handle(
          _id_eleve_attestation_scolaireMeta,
          id_eleve_attestation_scolaire.isAcceptableOrUnknown(
              data['id_eleve_attestation_scolaire']!,
              _id_eleve_attestation_scolaireMeta));
    }
    if (data.containsKey('id_personne_parent')) {
      context.handle(
          _id_personne_parentMeta,
          id_personne_parent.isAcceptableOrUnknown(
              data['id_personne_parent']!, _id_personne_parentMeta));
    }
    if (data.containsKey('id_personne_eleve')) {
      context.handle(
          _id_personne_eleveMeta,
          id_personne_eleve.isAcceptableOrUnknown(
              data['id_personne_eleve']!, _id_personne_eleveMeta));
    } else if (isInserting) {
      context.missing(_id_personne_eleveMeta);
    }
    if (data.containsKey('date_de_la_demande')) {
      context.handle(
          _date_de_la_demandeMeta,
          date_de_la_demande.isAcceptableOrUnknown(
              data['date_de_la_demande']!, _date_de_la_demandeMeta));
    } else if (isInserting) {
      context.missing(_date_de_la_demandeMeta);
    }
    if (data.containsKey('date_de_la_reception')) {
      context.handle(
          _date_de_la_receptionMeta,
          date_de_la_reception.isAcceptableOrUnknown(
              data['date_de_la_reception']!, _date_de_la_receptionMeta));
    }
    if (data.containsKey('nombre_de_copies')) {
      context.handle(
          _nombre_de_copiesMeta,
          nombre_de_copies.isAcceptableOrUnknown(
              data['nombre_de_copies']!, _nombre_de_copiesMeta));
    } else if (isInserting) {
      context.missing(_nombre_de_copiesMeta);
    }
    if (data.containsKey('idstatut')) {
      context.handle(_idstatutMeta,
          idstatut.isAcceptableOrUnknown(data['idstatut']!, _idstatutMeta));
    }
    if (data.containsKey('statut')) {
      context.handle(_statutMeta,
          statut.isAcceptableOrUnknown(data['statut']!, _statutMeta));
    }
    if (data.containsKey('parentnom')) {
      context.handle(_parentnomMeta,
          parentnom.isAcceptableOrUnknown(data['parentnom']!, _parentnomMeta));
    }
    if (data.containsKey('remove')) {
      context.handle(_removeMeta,
          remove.isAcceptableOrUnknown(data['remove']!, _removeMeta));
    }
    if (data.containsKey('send')) {
      context.handle(
          _sendMeta, send.isAcceptableOrUnknown(data['send']!, _sendMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_eleve_attestation_scolaire};
  @override
  DemandesAttestation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DemandesAttestation.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DemandesAttestationsTable createAlias(String alias) {
    return $DemandesAttestationsTable(attachedDatabase, alias);
  }
}

class RemoveDemandesAttestation extends DataClass
    implements Insertable<RemoveDemandesAttestation> {
  final int id_eleve_scolaire;
  final int id_personne;
  final bool send;
  RemoveDemandesAttestation(
      {required this.id_eleve_scolaire,
      required this.id_personne,
      required this.send});
  factory RemoveDemandesAttestation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RemoveDemandesAttestation(
      id_eleve_scolaire: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_eleve_scolaire'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      send: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}send'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_eleve_scolaire'] = Variable<int>(id_eleve_scolaire);
    map['id_personne'] = Variable<int>(id_personne);
    map['send'] = Variable<bool>(send);
    return map;
  }

  RemoveDemandesAttestationsCompanion toCompanion(bool nullToAbsent) {
    return RemoveDemandesAttestationsCompanion(
      id_eleve_scolaire: Value(id_eleve_scolaire),
      id_personne: Value(id_personne),
      send: Value(send),
    );
  }

  factory RemoveDemandesAttestation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RemoveDemandesAttestation(
      id_eleve_scolaire: serializer.fromJson<int>(json['id_eleve_scolaire']),
      id_personne: serializer.fromJson<int>(json['id_personne']),
      send: serializer.fromJson<bool>(json['send']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_eleve_scolaire': serializer.toJson<int>(id_eleve_scolaire),
      'id_personne': serializer.toJson<int>(id_personne),
      'send': serializer.toJson<bool>(send),
    };
  }

  RemoveDemandesAttestation copyWith(
          {int? id_eleve_scolaire, int? id_personne, bool? send}) =>
      RemoveDemandesAttestation(
        id_eleve_scolaire: id_eleve_scolaire ?? this.id_eleve_scolaire,
        id_personne: id_personne ?? this.id_personne,
        send: send ?? this.send,
      );
  @override
  String toString() {
    return (StringBuffer('RemoveDemandesAttestation(')
          ..write('id_eleve_scolaire: $id_eleve_scolaire, ')
          ..write('id_personne: $id_personne, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_eleve_scolaire, id_personne, send);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RemoveDemandesAttestation &&
          other.id_eleve_scolaire == this.id_eleve_scolaire &&
          other.id_personne == this.id_personne &&
          other.send == this.send);
}

class RemoveDemandesAttestationsCompanion
    extends UpdateCompanion<RemoveDemandesAttestation> {
  final Value<int> id_eleve_scolaire;
  final Value<int> id_personne;
  final Value<bool> send;
  const RemoveDemandesAttestationsCompanion({
    this.id_eleve_scolaire = const Value.absent(),
    this.id_personne = const Value.absent(),
    this.send = const Value.absent(),
  });
  RemoveDemandesAttestationsCompanion.insert({
    this.id_eleve_scolaire = const Value.absent(),
    required int id_personne,
    this.send = const Value.absent(),
  }) : id_personne = Value(id_personne);
  static Insertable<RemoveDemandesAttestation> custom({
    Expression<int>? id_eleve_scolaire,
    Expression<int>? id_personne,
    Expression<bool>? send,
  }) {
    return RawValuesInsertable({
      if (id_eleve_scolaire != null) 'id_eleve_scolaire': id_eleve_scolaire,
      if (id_personne != null) 'id_personne': id_personne,
      if (send != null) 'send': send,
    });
  }

  RemoveDemandesAttestationsCompanion copyWith(
      {Value<int>? id_eleve_scolaire,
      Value<int>? id_personne,
      Value<bool>? send}) {
    return RemoveDemandesAttestationsCompanion(
      id_eleve_scolaire: id_eleve_scolaire ?? this.id_eleve_scolaire,
      id_personne: id_personne ?? this.id_personne,
      send: send ?? this.send,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_eleve_scolaire.present) {
      map['id_eleve_scolaire'] = Variable<int>(id_eleve_scolaire.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (send.present) {
      map['send'] = Variable<bool>(send.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemoveDemandesAttestationsCompanion(')
          ..write('id_eleve_scolaire: $id_eleve_scolaire, ')
          ..write('id_personne: $id_personne, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }
}

class $RemoveDemandesAttestationsTable extends RemoveDemandesAttestations
    with
        TableInfo<$RemoveDemandesAttestationsTable, RemoveDemandesAttestation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemoveDemandesAttestationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_eleve_scolaireMeta =
      const VerificationMeta('id_eleve_scolaire');
  @override
  late final GeneratedColumn<int?> id_eleve_scolaire = GeneratedColumn<int?>(
      'id_eleve_scolaire', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sendMeta = const VerificationMeta('send');
  @override
  late final GeneratedColumn<bool?> send = GeneratedColumn<bool?>(
      'send', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (send IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id_eleve_scolaire, id_personne, send];
  @override
  String get aliasedName => _alias ?? 'remove_demandes_attestations';
  @override
  String get actualTableName => 'remove_demandes_attestations';
  @override
  VerificationContext validateIntegrity(
      Insertable<RemoveDemandesAttestation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_eleve_scolaire')) {
      context.handle(
          _id_eleve_scolaireMeta,
          id_eleve_scolaire.isAcceptableOrUnknown(
              data['id_eleve_scolaire']!, _id_eleve_scolaireMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    } else if (isInserting) {
      context.missing(_id_personneMeta);
    }
    if (data.containsKey('send')) {
      context.handle(
          _sendMeta, send.isAcceptableOrUnknown(data['send']!, _sendMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_eleve_scolaire};
  @override
  RemoveDemandesAttestation map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return RemoveDemandesAttestation.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RemoveDemandesAttestationsTable createAlias(String alias) {
    return $RemoveDemandesAttestationsTable(attachedDatabase, alias);
  }
}

class Emploitemp extends DataClass implements Insertable<Emploitemp> {
  final int id;
  final int id_jour;
  final int id_personne_eleve;
  final String? Jour;
  Emploitemp(
      {required this.id,
      required this.id_jour,
      required this.id_personne_eleve,
      this.Jour});
  factory Emploitemp.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Emploitemp(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      id_jour: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_jour'])!,
      id_personne_eleve: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_personne_eleve'])!,
      Jour: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}jour']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_jour'] = Variable<int>(id_jour);
    map['id_personne_eleve'] = Variable<int>(id_personne_eleve);
    if (!nullToAbsent || Jour != null) {
      map['jour'] = Variable<String?>(Jour);
    }
    return map;
  }

  EmploitempsCompanion toCompanion(bool nullToAbsent) {
    return EmploitempsCompanion(
      id: Value(id),
      id_jour: Value(id_jour),
      id_personne_eleve: Value(id_personne_eleve),
      Jour: Jour == null && nullToAbsent ? const Value.absent() : Value(Jour),
    );
  }

  factory Emploitemp.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Emploitemp(
      id: serializer.fromJson<int>(json['id']),
      id_jour: serializer.fromJson<int>(json['id_jour']),
      id_personne_eleve: serializer.fromJson<int>(json['id_personne_eleve']),
      Jour: serializer.fromJson<String?>(json['Jour']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'id_jour': serializer.toJson<int>(id_jour),
      'id_personne_eleve': serializer.toJson<int>(id_personne_eleve),
      'Jour': serializer.toJson<String?>(Jour),
    };
  }

  Emploitemp copyWith(
          {int? id, int? id_jour, int? id_personne_eleve, String? Jour}) =>
      Emploitemp(
        id: id ?? this.id,
        id_jour: id_jour ?? this.id_jour,
        id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
        Jour: Jour ?? this.Jour,
      );
  @override
  String toString() {
    return (StringBuffer('Emploitemp(')
          ..write('id: $id, ')
          ..write('id_jour: $id_jour, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('Jour: $Jour')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, id_jour, id_personne_eleve, Jour);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Emploitemp &&
          other.id == this.id &&
          other.id_jour == this.id_jour &&
          other.id_personne_eleve == this.id_personne_eleve &&
          other.Jour == this.Jour);
}

class EmploitempsCompanion extends UpdateCompanion<Emploitemp> {
  final Value<int> id;
  final Value<int> id_jour;
  final Value<int> id_personne_eleve;
  final Value<String?> Jour;
  const EmploitempsCompanion({
    this.id = const Value.absent(),
    this.id_jour = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.Jour = const Value.absent(),
  });
  EmploitempsCompanion.insert({
    this.id = const Value.absent(),
    required int id_jour,
    required int id_personne_eleve,
    this.Jour = const Value.absent(),
  })  : id_jour = Value(id_jour),
        id_personne_eleve = Value(id_personne_eleve);
  static Insertable<Emploitemp> custom({
    Expression<int>? id,
    Expression<int>? id_jour,
    Expression<int>? id_personne_eleve,
    Expression<String?>? Jour,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (id_jour != null) 'id_jour': id_jour,
      if (id_personne_eleve != null) 'id_personne_eleve': id_personne_eleve,
      if (Jour != null) 'jour': Jour,
    });
  }

  EmploitempsCompanion copyWith(
      {Value<int>? id,
      Value<int>? id_jour,
      Value<int>? id_personne_eleve,
      Value<String?>? Jour}) {
    return EmploitempsCompanion(
      id: id ?? this.id,
      id_jour: id_jour ?? this.id_jour,
      id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
      Jour: Jour ?? this.Jour,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (id_jour.present) {
      map['id_jour'] = Variable<int>(id_jour.value);
    }
    if (id_personne_eleve.present) {
      map['id_personne_eleve'] = Variable<int>(id_personne_eleve.value);
    }
    if (Jour.present) {
      map['jour'] = Variable<String?>(Jour.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmploitempsCompanion(')
          ..write('id: $id, ')
          ..write('id_jour: $id_jour, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('Jour: $Jour')
          ..write(')'))
        .toString();
  }
}

class $EmploitempsTable extends Emploitemps
    with TableInfo<$EmploitempsTable, Emploitemp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmploitempsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _id_jourMeta = const VerificationMeta('id_jour');
  @override
  late final GeneratedColumn<int?> id_jour = GeneratedColumn<int?>(
      'id_jour', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _id_personne_eleveMeta =
      const VerificationMeta('id_personne_eleve');
  @override
  late final GeneratedColumn<int?> id_personne_eleve = GeneratedColumn<int?>(
      'id_personne_eleve', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _JourMeta = const VerificationMeta('Jour');
  @override
  late final GeneratedColumn<String?> Jour = GeneratedColumn<String?>(
      'jour', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, id_jour, id_personne_eleve, Jour];
  @override
  String get aliasedName => _alias ?? 'emploitemps';
  @override
  String get actualTableName => 'emploitemps';
  @override
  VerificationContext validateIntegrity(Insertable<Emploitemp> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_jour')) {
      context.handle(_id_jourMeta,
          id_jour.isAcceptableOrUnknown(data['id_jour']!, _id_jourMeta));
    } else if (isInserting) {
      context.missing(_id_jourMeta);
    }
    if (data.containsKey('id_personne_eleve')) {
      context.handle(
          _id_personne_eleveMeta,
          id_personne_eleve.isAcceptableOrUnknown(
              data['id_personne_eleve']!, _id_personne_eleveMeta));
    } else if (isInserting) {
      context.missing(_id_personne_eleveMeta);
    }
    if (data.containsKey('jour')) {
      context.handle(
          _JourMeta, Jour.isAcceptableOrUnknown(data['jour']!, _JourMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Emploitemp map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Emploitemp.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EmploitempsTable createAlias(String alias) {
    return $EmploitempsTable(attachedDatabase, alias);
  }
}

class Seance extends DataClass implements Insertable<Seance> {
  final int id;
  final int? id_jour;
  final int? id_personne_eleve;
  final String? horaire_debut;
  final String? horaire_fin;
  final String? horaire_tranches_type;
  final String? matiere;
  final String? salle;
  Seance(
      {required this.id,
      this.id_jour,
      this.id_personne_eleve,
      this.horaire_debut,
      this.horaire_fin,
      this.horaire_tranches_type,
      this.matiere,
      this.salle});
  factory Seance.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Seance(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      id_jour: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_jour']),
      id_personne_eleve: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne_eleve']),
      horaire_debut: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}horaire_debut']),
      horaire_fin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}horaire_fin']),
      horaire_tranches_type: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}horaire_tranches_type']),
      matiere: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}matiere']),
      salle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}salle']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || id_jour != null) {
      map['id_jour'] = Variable<int?>(id_jour);
    }
    if (!nullToAbsent || id_personne_eleve != null) {
      map['id_personne_eleve'] = Variable<int?>(id_personne_eleve);
    }
    if (!nullToAbsent || horaire_debut != null) {
      map['horaire_debut'] = Variable<String?>(horaire_debut);
    }
    if (!nullToAbsent || horaire_fin != null) {
      map['horaire_fin'] = Variable<String?>(horaire_fin);
    }
    if (!nullToAbsent || horaire_tranches_type != null) {
      map['horaire_tranches_type'] = Variable<String?>(horaire_tranches_type);
    }
    if (!nullToAbsent || matiere != null) {
      map['matiere'] = Variable<String?>(matiere);
    }
    if (!nullToAbsent || salle != null) {
      map['salle'] = Variable<String?>(salle);
    }
    return map;
  }

  SeancesCompanion toCompanion(bool nullToAbsent) {
    return SeancesCompanion(
      id: Value(id),
      id_jour: id_jour == null && nullToAbsent
          ? const Value.absent()
          : Value(id_jour),
      id_personne_eleve: id_personne_eleve == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne_eleve),
      horaire_debut: horaire_debut == null && nullToAbsent
          ? const Value.absent()
          : Value(horaire_debut),
      horaire_fin: horaire_fin == null && nullToAbsent
          ? const Value.absent()
          : Value(horaire_fin),
      horaire_tranches_type: horaire_tranches_type == null && nullToAbsent
          ? const Value.absent()
          : Value(horaire_tranches_type),
      matiere: matiere == null && nullToAbsent
          ? const Value.absent()
          : Value(matiere),
      salle:
          salle == null && nullToAbsent ? const Value.absent() : Value(salle),
    );
  }

  factory Seance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Seance(
      id: serializer.fromJson<int>(json['id']),
      id_jour: serializer.fromJson<int?>(json['id_jour']),
      id_personne_eleve: serializer.fromJson<int?>(json['id_personne_eleve']),
      horaire_debut: serializer.fromJson<String?>(json['horaire_debut']),
      horaire_fin: serializer.fromJson<String?>(json['horaire_fin']),
      horaire_tranches_type:
          serializer.fromJson<String?>(json['horaire_tranches_type']),
      matiere: serializer.fromJson<String?>(json['matiere']),
      salle: serializer.fromJson<String?>(json['salle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'id_jour': serializer.toJson<int?>(id_jour),
      'id_personne_eleve': serializer.toJson<int?>(id_personne_eleve),
      'horaire_debut': serializer.toJson<String?>(horaire_debut),
      'horaire_fin': serializer.toJson<String?>(horaire_fin),
      'horaire_tranches_type':
          serializer.toJson<String?>(horaire_tranches_type),
      'matiere': serializer.toJson<String?>(matiere),
      'salle': serializer.toJson<String?>(salle),
    };
  }

  Seance copyWith(
          {int? id,
          int? id_jour,
          int? id_personne_eleve,
          String? horaire_debut,
          String? horaire_fin,
          String? horaire_tranches_type,
          String? matiere,
          String? salle}) =>
      Seance(
        id: id ?? this.id,
        id_jour: id_jour ?? this.id_jour,
        id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
        horaire_debut: horaire_debut ?? this.horaire_debut,
        horaire_fin: horaire_fin ?? this.horaire_fin,
        horaire_tranches_type:
            horaire_tranches_type ?? this.horaire_tranches_type,
        matiere: matiere ?? this.matiere,
        salle: salle ?? this.salle,
      );
  @override
  String toString() {
    return (StringBuffer('Seance(')
          ..write('id: $id, ')
          ..write('id_jour: $id_jour, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('horaire_debut: $horaire_debut, ')
          ..write('horaire_fin: $horaire_fin, ')
          ..write('horaire_tranches_type: $horaire_tranches_type, ')
          ..write('matiere: $matiere, ')
          ..write('salle: $salle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, id_jour, id_personne_eleve, horaire_debut,
      horaire_fin, horaire_tranches_type, matiere, salle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Seance &&
          other.id == this.id &&
          other.id_jour == this.id_jour &&
          other.id_personne_eleve == this.id_personne_eleve &&
          other.horaire_debut == this.horaire_debut &&
          other.horaire_fin == this.horaire_fin &&
          other.horaire_tranches_type == this.horaire_tranches_type &&
          other.matiere == this.matiere &&
          other.salle == this.salle);
}

class SeancesCompanion extends UpdateCompanion<Seance> {
  final Value<int> id;
  final Value<int?> id_jour;
  final Value<int?> id_personne_eleve;
  final Value<String?> horaire_debut;
  final Value<String?> horaire_fin;
  final Value<String?> horaire_tranches_type;
  final Value<String?> matiere;
  final Value<String?> salle;
  const SeancesCompanion({
    this.id = const Value.absent(),
    this.id_jour = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.horaire_debut = const Value.absent(),
    this.horaire_fin = const Value.absent(),
    this.horaire_tranches_type = const Value.absent(),
    this.matiere = const Value.absent(),
    this.salle = const Value.absent(),
  });
  SeancesCompanion.insert({
    this.id = const Value.absent(),
    this.id_jour = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.horaire_debut = const Value.absent(),
    this.horaire_fin = const Value.absent(),
    this.horaire_tranches_type = const Value.absent(),
    this.matiere = const Value.absent(),
    this.salle = const Value.absent(),
  });
  static Insertable<Seance> custom({
    Expression<int>? id,
    Expression<int?>? id_jour,
    Expression<int?>? id_personne_eleve,
    Expression<String?>? horaire_debut,
    Expression<String?>? horaire_fin,
    Expression<String?>? horaire_tranches_type,
    Expression<String?>? matiere,
    Expression<String?>? salle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (id_jour != null) 'id_jour': id_jour,
      if (id_personne_eleve != null) 'id_personne_eleve': id_personne_eleve,
      if (horaire_debut != null) 'horaire_debut': horaire_debut,
      if (horaire_fin != null) 'horaire_fin': horaire_fin,
      if (horaire_tranches_type != null)
        'horaire_tranches_type': horaire_tranches_type,
      if (matiere != null) 'matiere': matiere,
      if (salle != null) 'salle': salle,
    });
  }

  SeancesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? id_jour,
      Value<int?>? id_personne_eleve,
      Value<String?>? horaire_debut,
      Value<String?>? horaire_fin,
      Value<String?>? horaire_tranches_type,
      Value<String?>? matiere,
      Value<String?>? salle}) {
    return SeancesCompanion(
      id: id ?? this.id,
      id_jour: id_jour ?? this.id_jour,
      id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
      horaire_debut: horaire_debut ?? this.horaire_debut,
      horaire_fin: horaire_fin ?? this.horaire_fin,
      horaire_tranches_type:
          horaire_tranches_type ?? this.horaire_tranches_type,
      matiere: matiere ?? this.matiere,
      salle: salle ?? this.salle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (id_jour.present) {
      map['id_jour'] = Variable<int?>(id_jour.value);
    }
    if (id_personne_eleve.present) {
      map['id_personne_eleve'] = Variable<int?>(id_personne_eleve.value);
    }
    if (horaire_debut.present) {
      map['horaire_debut'] = Variable<String?>(horaire_debut.value);
    }
    if (horaire_fin.present) {
      map['horaire_fin'] = Variable<String?>(horaire_fin.value);
    }
    if (horaire_tranches_type.present) {
      map['horaire_tranches_type'] =
          Variable<String?>(horaire_tranches_type.value);
    }
    if (matiere.present) {
      map['matiere'] = Variable<String?>(matiere.value);
    }
    if (salle.present) {
      map['salle'] = Variable<String?>(salle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeancesCompanion(')
          ..write('id: $id, ')
          ..write('id_jour: $id_jour, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('horaire_debut: $horaire_debut, ')
          ..write('horaire_fin: $horaire_fin, ')
          ..write('horaire_tranches_type: $horaire_tranches_type, ')
          ..write('matiere: $matiere, ')
          ..write('salle: $salle')
          ..write(')'))
        .toString();
  }
}

class $SeancesTable extends Seances with TableInfo<$SeancesTable, Seance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeancesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _id_jourMeta = const VerificationMeta('id_jour');
  @override
  late final GeneratedColumn<int?> id_jour = GeneratedColumn<int?>(
      'id_jour', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_eleveMeta =
      const VerificationMeta('id_personne_eleve');
  @override
  late final GeneratedColumn<int?> id_personne_eleve = GeneratedColumn<int?>(
      'id_personne_eleve', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _horaire_debutMeta =
      const VerificationMeta('horaire_debut');
  @override
  late final GeneratedColumn<String?> horaire_debut = GeneratedColumn<String?>(
      'horaire_debut', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _horaire_finMeta =
      const VerificationMeta('horaire_fin');
  @override
  late final GeneratedColumn<String?> horaire_fin = GeneratedColumn<String?>(
      'horaire_fin', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _horaire_tranches_typeMeta =
      const VerificationMeta('horaire_tranches_type');
  @override
  late final GeneratedColumn<String?> horaire_tranches_type =
      GeneratedColumn<String?>('horaire_tranches_type', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _matiereMeta = const VerificationMeta('matiere');
  @override
  late final GeneratedColumn<String?> matiere = GeneratedColumn<String?>(
      'matiere', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _salleMeta = const VerificationMeta('salle');
  @override
  late final GeneratedColumn<String?> salle = GeneratedColumn<String?>(
      'salle', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        id_jour,
        id_personne_eleve,
        horaire_debut,
        horaire_fin,
        horaire_tranches_type,
        matiere,
        salle
      ];
  @override
  String get aliasedName => _alias ?? 'seances';
  @override
  String get actualTableName => 'seances';
  @override
  VerificationContext validateIntegrity(Insertable<Seance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_jour')) {
      context.handle(_id_jourMeta,
          id_jour.isAcceptableOrUnknown(data['id_jour']!, _id_jourMeta));
    }
    if (data.containsKey('id_personne_eleve')) {
      context.handle(
          _id_personne_eleveMeta,
          id_personne_eleve.isAcceptableOrUnknown(
              data['id_personne_eleve']!, _id_personne_eleveMeta));
    }
    if (data.containsKey('horaire_debut')) {
      context.handle(
          _horaire_debutMeta,
          horaire_debut.isAcceptableOrUnknown(
              data['horaire_debut']!, _horaire_debutMeta));
    }
    if (data.containsKey('horaire_fin')) {
      context.handle(
          _horaire_finMeta,
          horaire_fin.isAcceptableOrUnknown(
              data['horaire_fin']!, _horaire_finMeta));
    }
    if (data.containsKey('horaire_tranches_type')) {
      context.handle(
          _horaire_tranches_typeMeta,
          horaire_tranches_type.isAcceptableOrUnknown(
              data['horaire_tranches_type']!, _horaire_tranches_typeMeta));
    }
    if (data.containsKey('matiere')) {
      context.handle(_matiereMeta,
          matiere.isAcceptableOrUnknown(data['matiere']!, _matiereMeta));
    }
    if (data.containsKey('salle')) {
      context.handle(
          _salleMeta, salle.isAcceptableOrUnknown(data['salle']!, _salleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Seance map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Seance.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SeancesTable createAlias(String alias) {
    return $SeancesTable(attachedDatabase, alias);
  }
}

class Enseignant extends DataClass implements Insertable<Enseignant> {
  final int id;
  final int id_personne;
  final String? nom;
  final String? prenom;
  final int id_jour;
  Enseignant(
      {required this.id,
      required this.id_personne,
      this.nom,
      this.prenom,
      required this.id_jour});
  factory Enseignant.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Enseignant(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      nom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom']),
      prenom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom']),
      id_jour: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_jour'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_personne'] = Variable<int>(id_personne);
    if (!nullToAbsent || nom != null) {
      map['nom'] = Variable<String?>(nom);
    }
    if (!nullToAbsent || prenom != null) {
      map['prenom'] = Variable<String?>(prenom);
    }
    map['id_jour'] = Variable<int>(id_jour);
    return map;
  }

  EnseignantsCompanion toCompanion(bool nullToAbsent) {
    return EnseignantsCompanion(
      id: Value(id),
      id_personne: Value(id_personne),
      nom: nom == null && nullToAbsent ? const Value.absent() : Value(nom),
      prenom:
          prenom == null && nullToAbsent ? const Value.absent() : Value(prenom),
      id_jour: Value(id_jour),
    );
  }

  factory Enseignant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Enseignant(
      id: serializer.fromJson<int>(json['id']),
      id_personne: serializer.fromJson<int>(json['id_personne']),
      nom: serializer.fromJson<String?>(json['nom']),
      prenom: serializer.fromJson<String?>(json['prenom']),
      id_jour: serializer.fromJson<int>(json['id_jour']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'id_personne': serializer.toJson<int>(id_personne),
      'nom': serializer.toJson<String?>(nom),
      'prenom': serializer.toJson<String?>(prenom),
      'id_jour': serializer.toJson<int>(id_jour),
    };
  }

  Enseignant copyWith(
          {int? id,
          int? id_personne,
          String? nom,
          String? prenom,
          int? id_jour}) =>
      Enseignant(
        id: id ?? this.id,
        id_personne: id_personne ?? this.id_personne,
        nom: nom ?? this.nom,
        prenom: prenom ?? this.prenom,
        id_jour: id_jour ?? this.id_jour,
      );
  @override
  String toString() {
    return (StringBuffer('Enseignant(')
          ..write('id: $id, ')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('id_jour: $id_jour')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, id_personne, nom, prenom, id_jour);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enseignant &&
          other.id == this.id &&
          other.id_personne == this.id_personne &&
          other.nom == this.nom &&
          other.prenom == this.prenom &&
          other.id_jour == this.id_jour);
}

class EnseignantsCompanion extends UpdateCompanion<Enseignant> {
  final Value<int> id;
  final Value<int> id_personne;
  final Value<String?> nom;
  final Value<String?> prenom;
  final Value<int> id_jour;
  const EnseignantsCompanion({
    this.id = const Value.absent(),
    this.id_personne = const Value.absent(),
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    this.id_jour = const Value.absent(),
  });
  EnseignantsCompanion.insert({
    this.id = const Value.absent(),
    required int id_personne,
    this.nom = const Value.absent(),
    this.prenom = const Value.absent(),
    required int id_jour,
  })  : id_personne = Value(id_personne),
        id_jour = Value(id_jour);
  static Insertable<Enseignant> custom({
    Expression<int>? id,
    Expression<int>? id_personne,
    Expression<String?>? nom,
    Expression<String?>? prenom,
    Expression<int>? id_jour,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (id_personne != null) 'id_personne': id_personne,
      if (nom != null) 'nom': nom,
      if (prenom != null) 'prenom': prenom,
      if (id_jour != null) 'id_jour': id_jour,
    });
  }

  EnseignantsCompanion copyWith(
      {Value<int>? id,
      Value<int>? id_personne,
      Value<String?>? nom,
      Value<String?>? prenom,
      Value<int>? id_jour}) {
    return EnseignantsCompanion(
      id: id ?? this.id,
      id_personne: id_personne ?? this.id_personne,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      id_jour: id_jour ?? this.id_jour,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String?>(nom.value);
    }
    if (prenom.present) {
      map['prenom'] = Variable<String?>(prenom.value);
    }
    if (id_jour.present) {
      map['id_jour'] = Variable<int>(id_jour.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnseignantsCompanion(')
          ..write('id: $id, ')
          ..write('id_personne: $id_personne, ')
          ..write('nom: $nom, ')
          ..write('prenom: $prenom, ')
          ..write('id_jour: $id_jour')
          ..write(')'))
        .toString();
  }
}

class $EnseignantsTable extends Enseignants
    with TableInfo<$EnseignantsTable, Enseignant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnseignantsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String?> nom = GeneratedColumn<String?>(
      'nom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _prenomMeta = const VerificationMeta('prenom');
  @override
  late final GeneratedColumn<String?> prenom = GeneratedColumn<String?>(
      'prenom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _id_jourMeta = const VerificationMeta('id_jour');
  @override
  late final GeneratedColumn<int?> id_jour = GeneratedColumn<int?>(
      'id_jour', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, id_personne, nom, prenom, id_jour];
  @override
  String get aliasedName => _alias ?? 'enseignants';
  @override
  String get actualTableName => 'enseignants';
  @override
  VerificationContext validateIntegrity(Insertable<Enseignant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    } else if (isInserting) {
      context.missing(_id_personneMeta);
    }
    if (data.containsKey('nom')) {
      context.handle(
          _nomMeta, nom.isAcceptableOrUnknown(data['nom']!, _nomMeta));
    }
    if (data.containsKey('prenom')) {
      context.handle(_prenomMeta,
          prenom.isAcceptableOrUnknown(data['prenom']!, _prenomMeta));
    }
    if (data.containsKey('id_jour')) {
      context.handle(_id_jourMeta,
          id_jour.isAcceptableOrUnknown(data['id_jour']!, _id_jourMeta));
    } else if (isInserting) {
      context.missing(_id_jourMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Enseignant map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Enseignant.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EnseignantsTable createAlias(String alias) {
    return $EnseignantsTable(attachedDatabase, alias);
  }
}

class ReservationsCantineDate extends DataClass
    implements Insertable<ReservationsCantineDate> {
  final DateTime? date_cantine;
  ReservationsCantineDate({this.date_cantine});
  factory ReservationsCantineDate.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ReservationsCantineDate(
      date_cantine: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_cantine']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || date_cantine != null) {
      map['date_cantine'] = Variable<DateTime?>(date_cantine);
    }
    return map;
  }

  ReservationsCantineDatesCompanion toCompanion(bool nullToAbsent) {
    return ReservationsCantineDatesCompanion(
      date_cantine: date_cantine == null && nullToAbsent
          ? const Value.absent()
          : Value(date_cantine),
    );
  }

  factory ReservationsCantineDate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ReservationsCantineDate(
      date_cantine: serializer.fromJson<DateTime?>(json['date_cantine']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date_cantine': serializer.toJson<DateTime?>(date_cantine),
    };
  }

  ReservationsCantineDate copyWith({DateTime? date_cantine}) =>
      ReservationsCantineDate(
        date_cantine: date_cantine ?? this.date_cantine,
      );
  @override
  String toString() {
    return (StringBuffer('ReservationsCantineDate(')
          ..write('date_cantine: $date_cantine')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => date_cantine.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReservationsCantineDate &&
          other.date_cantine == this.date_cantine);
}

class ReservationsCantineDatesCompanion
    extends UpdateCompanion<ReservationsCantineDate> {
  final Value<DateTime?> date_cantine;
  const ReservationsCantineDatesCompanion({
    this.date_cantine = const Value.absent(),
  });
  ReservationsCantineDatesCompanion.insert({
    this.date_cantine = const Value.absent(),
  });
  static Insertable<ReservationsCantineDate> custom({
    Expression<DateTime?>? date_cantine,
  }) {
    return RawValuesInsertable({
      if (date_cantine != null) 'date_cantine': date_cantine,
    });
  }

  ReservationsCantineDatesCompanion copyWith({Value<DateTime?>? date_cantine}) {
    return ReservationsCantineDatesCompanion(
      date_cantine: date_cantine ?? this.date_cantine,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date_cantine.present) {
      map['date_cantine'] = Variable<DateTime?>(date_cantine.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservationsCantineDatesCompanion(')
          ..write('date_cantine: $date_cantine')
          ..write(')'))
        .toString();
  }
}

class $ReservationsCantineDatesTable extends ReservationsCantineDates
    with TableInfo<$ReservationsCantineDatesTable, ReservationsCantineDate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReservationsCantineDatesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _date_cantineMeta =
      const VerificationMeta('date_cantine');
  @override
  late final GeneratedColumn<DateTime?> date_cantine =
      GeneratedColumn<DateTime?>('date_cantine', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [date_cantine];
  @override
  String get aliasedName => _alias ?? 'reservations_cantine_dates';
  @override
  String get actualTableName => 'reservations_cantine_dates';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReservationsCantineDate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_cantine')) {
      context.handle(
          _date_cantineMeta,
          date_cantine.isAcceptableOrUnknown(
              data['date_cantine']!, _date_cantineMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date_cantine};
  @override
  ReservationsCantineDate map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return ReservationsCantineDate.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReservationsCantineDatesTable createAlias(String alias) {
    return $ReservationsCantineDatesTable(attachedDatabase, alias);
  }
}

class ReservationsCantine extends DataClass
    implements Insertable<ReservationsCantine> {
  final int id_cantine_journaliere;
  final int? id_personne_parent;
  final int? id_personne_eleve;
  final String? parentnom;
  final int? Paiement;
  final DateTime? date_cantine;
  ReservationsCantine(
      {required this.id_cantine_journaliere,
      this.id_personne_parent,
      this.id_personne_eleve,
      this.parentnom,
      this.Paiement,
      this.date_cantine});
  factory ReservationsCantine.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ReservationsCantine(
      id_cantine_journaliere: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_cantine_journaliere'])!,
      id_personne_parent: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_personne_parent']),
      id_personne_eleve: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne_eleve']),
      parentnom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parentnom']),
      Paiement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}paiement']),
      date_cantine: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_cantine']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_cantine_journaliere'] = Variable<int>(id_cantine_journaliere);
    if (!nullToAbsent || id_personne_parent != null) {
      map['id_personne_parent'] = Variable<int?>(id_personne_parent);
    }
    if (!nullToAbsent || id_personne_eleve != null) {
      map['id_personne_eleve'] = Variable<int?>(id_personne_eleve);
    }
    if (!nullToAbsent || parentnom != null) {
      map['parentnom'] = Variable<String?>(parentnom);
    }
    if (!nullToAbsent || Paiement != null) {
      map['paiement'] = Variable<int?>(Paiement);
    }
    if (!nullToAbsent || date_cantine != null) {
      map['date_cantine'] = Variable<DateTime?>(date_cantine);
    }
    return map;
  }

  ReservationsCantinesCompanion toCompanion(bool nullToAbsent) {
    return ReservationsCantinesCompanion(
      id_cantine_journaliere: Value(id_cantine_journaliere),
      id_personne_parent: id_personne_parent == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne_parent),
      id_personne_eleve: id_personne_eleve == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne_eleve),
      parentnom: parentnom == null && nullToAbsent
          ? const Value.absent()
          : Value(parentnom),
      Paiement: Paiement == null && nullToAbsent
          ? const Value.absent()
          : Value(Paiement),
      date_cantine: date_cantine == null && nullToAbsent
          ? const Value.absent()
          : Value(date_cantine),
    );
  }

  factory ReservationsCantine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ReservationsCantine(
      id_cantine_journaliere:
          serializer.fromJson<int>(json['id_cantine_journaliere']),
      id_personne_parent: serializer.fromJson<int?>(json['id_personne_parent']),
      id_personne_eleve: serializer.fromJson<int?>(json['id_personne_eleve']),
      parentnom: serializer.fromJson<String?>(json['parentnom']),
      Paiement: serializer.fromJson<int?>(json['Paiement']),
      date_cantine: serializer.fromJson<DateTime?>(json['date_cantine']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_cantine_journaliere': serializer.toJson<int>(id_cantine_journaliere),
      'id_personne_parent': serializer.toJson<int?>(id_personne_parent),
      'id_personne_eleve': serializer.toJson<int?>(id_personne_eleve),
      'parentnom': serializer.toJson<String?>(parentnom),
      'Paiement': serializer.toJson<int?>(Paiement),
      'date_cantine': serializer.toJson<DateTime?>(date_cantine),
    };
  }

  ReservationsCantine copyWith(
          {int? id_cantine_journaliere,
          int? id_personne_parent,
          int? id_personne_eleve,
          String? parentnom,
          int? Paiement,
          DateTime? date_cantine}) =>
      ReservationsCantine(
        id_cantine_journaliere:
            id_cantine_journaliere ?? this.id_cantine_journaliere,
        id_personne_parent: id_personne_parent ?? this.id_personne_parent,
        id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
        parentnom: parentnom ?? this.parentnom,
        Paiement: Paiement ?? this.Paiement,
        date_cantine: date_cantine ?? this.date_cantine,
      );
  @override
  String toString() {
    return (StringBuffer('ReservationsCantine(')
          ..write('id_cantine_journaliere: $id_cantine_journaliere, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('parentnom: $parentnom, ')
          ..write('Paiement: $Paiement, ')
          ..write('date_cantine: $date_cantine')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_cantine_journaliere, id_personne_parent,
      id_personne_eleve, parentnom, Paiement, date_cantine);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReservationsCantine &&
          other.id_cantine_journaliere == this.id_cantine_journaliere &&
          other.id_personne_parent == this.id_personne_parent &&
          other.id_personne_eleve == this.id_personne_eleve &&
          other.parentnom == this.parentnom &&
          other.Paiement == this.Paiement &&
          other.date_cantine == this.date_cantine);
}

class ReservationsCantinesCompanion
    extends UpdateCompanion<ReservationsCantine> {
  final Value<int> id_cantine_journaliere;
  final Value<int?> id_personne_parent;
  final Value<int?> id_personne_eleve;
  final Value<String?> parentnom;
  final Value<int?> Paiement;
  final Value<DateTime?> date_cantine;
  const ReservationsCantinesCompanion({
    this.id_cantine_journaliere = const Value.absent(),
    this.id_personne_parent = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.parentnom = const Value.absent(),
    this.Paiement = const Value.absent(),
    this.date_cantine = const Value.absent(),
  });
  ReservationsCantinesCompanion.insert({
    this.id_cantine_journaliere = const Value.absent(),
    this.id_personne_parent = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.parentnom = const Value.absent(),
    this.Paiement = const Value.absent(),
    this.date_cantine = const Value.absent(),
  });
  static Insertable<ReservationsCantine> custom({
    Expression<int>? id_cantine_journaliere,
    Expression<int?>? id_personne_parent,
    Expression<int?>? id_personne_eleve,
    Expression<String?>? parentnom,
    Expression<int?>? Paiement,
    Expression<DateTime?>? date_cantine,
  }) {
    return RawValuesInsertable({
      if (id_cantine_journaliere != null)
        'id_cantine_journaliere': id_cantine_journaliere,
      if (id_personne_parent != null) 'id_personne_parent': id_personne_parent,
      if (id_personne_eleve != null) 'id_personne_eleve': id_personne_eleve,
      if (parentnom != null) 'parentnom': parentnom,
      if (Paiement != null) 'paiement': Paiement,
      if (date_cantine != null) 'date_cantine': date_cantine,
    });
  }

  ReservationsCantinesCompanion copyWith(
      {Value<int>? id_cantine_journaliere,
      Value<int?>? id_personne_parent,
      Value<int?>? id_personne_eleve,
      Value<String?>? parentnom,
      Value<int?>? Paiement,
      Value<DateTime?>? date_cantine}) {
    return ReservationsCantinesCompanion(
      id_cantine_journaliere:
          id_cantine_journaliere ?? this.id_cantine_journaliere,
      id_personne_parent: id_personne_parent ?? this.id_personne_parent,
      id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
      parentnom: parentnom ?? this.parentnom,
      Paiement: Paiement ?? this.Paiement,
      date_cantine: date_cantine ?? this.date_cantine,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_cantine_journaliere.present) {
      map['id_cantine_journaliere'] =
          Variable<int>(id_cantine_journaliere.value);
    }
    if (id_personne_parent.present) {
      map['id_personne_parent'] = Variable<int?>(id_personne_parent.value);
    }
    if (id_personne_eleve.present) {
      map['id_personne_eleve'] = Variable<int?>(id_personne_eleve.value);
    }
    if (parentnom.present) {
      map['parentnom'] = Variable<String?>(parentnom.value);
    }
    if (Paiement.present) {
      map['paiement'] = Variable<int?>(Paiement.value);
    }
    if (date_cantine.present) {
      map['date_cantine'] = Variable<DateTime?>(date_cantine.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservationsCantinesCompanion(')
          ..write('id_cantine_journaliere: $id_cantine_journaliere, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('parentnom: $parentnom, ')
          ..write('Paiement: $Paiement, ')
          ..write('date_cantine: $date_cantine')
          ..write(')'))
        .toString();
  }
}

class $ReservationsCantinesTable extends ReservationsCantines
    with TableInfo<$ReservationsCantinesTable, ReservationsCantine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReservationsCantinesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_cantine_journaliereMeta =
      const VerificationMeta('id_cantine_journaliere');
  @override
  late final GeneratedColumn<int?> id_cantine_journaliere =
      GeneratedColumn<int?>('id_cantine_journaliere', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_parentMeta =
      const VerificationMeta('id_personne_parent');
  @override
  late final GeneratedColumn<int?> id_personne_parent = GeneratedColumn<int?>(
      'id_personne_parent', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_eleveMeta =
      const VerificationMeta('id_personne_eleve');
  @override
  late final GeneratedColumn<int?> id_personne_eleve = GeneratedColumn<int?>(
      'id_personne_eleve', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _parentnomMeta = const VerificationMeta('parentnom');
  @override
  late final GeneratedColumn<String?> parentnom = GeneratedColumn<String?>(
      'parentnom', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _PaiementMeta = const VerificationMeta('Paiement');
  @override
  late final GeneratedColumn<int?> Paiement = GeneratedColumn<int?>(
      'paiement', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _date_cantineMeta =
      const VerificationMeta('date_cantine');
  @override
  late final GeneratedColumn<DateTime?> date_cantine =
      GeneratedColumn<DateTime?>('date_cantine', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_cantine_journaliere,
        id_personne_parent,
        id_personne_eleve,
        parentnom,
        Paiement,
        date_cantine
      ];
  @override
  String get aliasedName => _alias ?? 'reservations_cantines';
  @override
  String get actualTableName => 'reservations_cantines';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReservationsCantine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_cantine_journaliere')) {
      context.handle(
          _id_cantine_journaliereMeta,
          id_cantine_journaliere.isAcceptableOrUnknown(
              data['id_cantine_journaliere']!, _id_cantine_journaliereMeta));
    }
    if (data.containsKey('id_personne_parent')) {
      context.handle(
          _id_personne_parentMeta,
          id_personne_parent.isAcceptableOrUnknown(
              data['id_personne_parent']!, _id_personne_parentMeta));
    }
    if (data.containsKey('id_personne_eleve')) {
      context.handle(
          _id_personne_eleveMeta,
          id_personne_eleve.isAcceptableOrUnknown(
              data['id_personne_eleve']!, _id_personne_eleveMeta));
    }
    if (data.containsKey('parentnom')) {
      context.handle(_parentnomMeta,
          parentnom.isAcceptableOrUnknown(data['parentnom']!, _parentnomMeta));
    }
    if (data.containsKey('paiement')) {
      context.handle(_PaiementMeta,
          Paiement.isAcceptableOrUnknown(data['paiement']!, _PaiementMeta));
    }
    if (data.containsKey('date_cantine')) {
      context.handle(
          _date_cantineMeta,
          date_cantine.isAcceptableOrUnknown(
              data['date_cantine']!, _date_cantineMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_cantine_journaliere};
  @override
  ReservationsCantine map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ReservationsCantine.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReservationsCantinesTable createAlias(String alias) {
    return $ReservationsCantinesTable(attachedDatabase, alias);
  }
}

class PlanCantine extends DataClass implements Insertable<PlanCantine> {
  final int id_cantine_type;
  final DateTime? date_cantine;
  final String? cantine_type_description;
  PlanCantine(
      {required this.id_cantine_type,
      this.date_cantine,
      this.cantine_type_description});
  factory PlanCantine.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlanCantine(
      id_cantine_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_cantine_type'])!,
      date_cantine: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_cantine']),
      cantine_type_description: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}cantine_type_description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_cantine_type'] = Variable<int>(id_cantine_type);
    if (!nullToAbsent || date_cantine != null) {
      map['date_cantine'] = Variable<DateTime?>(date_cantine);
    }
    if (!nullToAbsent || cantine_type_description != null) {
      map['cantine_type_description'] =
          Variable<String?>(cantine_type_description);
    }
    return map;
  }

  PlanCantinesCompanion toCompanion(bool nullToAbsent) {
    return PlanCantinesCompanion(
      id_cantine_type: Value(id_cantine_type),
      date_cantine: date_cantine == null && nullToAbsent
          ? const Value.absent()
          : Value(date_cantine),
      cantine_type_description: cantine_type_description == null && nullToAbsent
          ? const Value.absent()
          : Value(cantine_type_description),
    );
  }

  factory PlanCantine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlanCantine(
      id_cantine_type: serializer.fromJson<int>(json['id_cantine_type']),
      date_cantine: serializer.fromJson<DateTime?>(json['date_cantine']),
      cantine_type_description:
          serializer.fromJson<String?>(json['cantine_type_description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_cantine_type': serializer.toJson<int>(id_cantine_type),
      'date_cantine': serializer.toJson<DateTime?>(date_cantine),
      'cantine_type_description':
          serializer.toJson<String?>(cantine_type_description),
    };
  }

  PlanCantine copyWith(
          {int? id_cantine_type,
          DateTime? date_cantine,
          String? cantine_type_description}) =>
      PlanCantine(
        id_cantine_type: id_cantine_type ?? this.id_cantine_type,
        date_cantine: date_cantine ?? this.date_cantine,
        cantine_type_description:
            cantine_type_description ?? this.cantine_type_description,
      );
  @override
  String toString() {
    return (StringBuffer('PlanCantine(')
          ..write('id_cantine_type: $id_cantine_type, ')
          ..write('date_cantine: $date_cantine, ')
          ..write('cantine_type_description: $cantine_type_description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id_cantine_type, date_cantine, cantine_type_description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanCantine &&
          other.id_cantine_type == this.id_cantine_type &&
          other.date_cantine == this.date_cantine &&
          other.cantine_type_description == this.cantine_type_description);
}

class PlanCantinesCompanion extends UpdateCompanion<PlanCantine> {
  final Value<int> id_cantine_type;
  final Value<DateTime?> date_cantine;
  final Value<String?> cantine_type_description;
  const PlanCantinesCompanion({
    this.id_cantine_type = const Value.absent(),
    this.date_cantine = const Value.absent(),
    this.cantine_type_description = const Value.absent(),
  });
  PlanCantinesCompanion.insert({
    this.id_cantine_type = const Value.absent(),
    this.date_cantine = const Value.absent(),
    this.cantine_type_description = const Value.absent(),
  });
  static Insertable<PlanCantine> custom({
    Expression<int>? id_cantine_type,
    Expression<DateTime?>? date_cantine,
    Expression<String?>? cantine_type_description,
  }) {
    return RawValuesInsertable({
      if (id_cantine_type != null) 'id_cantine_type': id_cantine_type,
      if (date_cantine != null) 'date_cantine': date_cantine,
      if (cantine_type_description != null)
        'cantine_type_description': cantine_type_description,
    });
  }

  PlanCantinesCompanion copyWith(
      {Value<int>? id_cantine_type,
      Value<DateTime?>? date_cantine,
      Value<String?>? cantine_type_description}) {
    return PlanCantinesCompanion(
      id_cantine_type: id_cantine_type ?? this.id_cantine_type,
      date_cantine: date_cantine ?? this.date_cantine,
      cantine_type_description:
          cantine_type_description ?? this.cantine_type_description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_cantine_type.present) {
      map['id_cantine_type'] = Variable<int>(id_cantine_type.value);
    }
    if (date_cantine.present) {
      map['date_cantine'] = Variable<DateTime?>(date_cantine.value);
    }
    if (cantine_type_description.present) {
      map['cantine_type_description'] =
          Variable<String?>(cantine_type_description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanCantinesCompanion(')
          ..write('id_cantine_type: $id_cantine_type, ')
          ..write('date_cantine: $date_cantine, ')
          ..write('cantine_type_description: $cantine_type_description')
          ..write(')'))
        .toString();
  }
}

class $PlanCantinesTable extends PlanCantines
    with TableInfo<$PlanCantinesTable, PlanCantine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanCantinesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_cantine_typeMeta =
      const VerificationMeta('id_cantine_type');
  @override
  late final GeneratedColumn<int?> id_cantine_type = GeneratedColumn<int?>(
      'id_cantine_type', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _date_cantineMeta =
      const VerificationMeta('date_cantine');
  @override
  late final GeneratedColumn<DateTime?> date_cantine =
      GeneratedColumn<DateTime?>('date_cantine', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _cantine_type_descriptionMeta =
      const VerificationMeta('cantine_type_description');
  @override
  late final GeneratedColumn<String?> cantine_type_description =
      GeneratedColumn<String?>('cantine_type_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id_cantine_type, date_cantine, cantine_type_description];
  @override
  String get aliasedName => _alias ?? 'plan_cantines';
  @override
  String get actualTableName => 'plan_cantines';
  @override
  VerificationContext validateIntegrity(Insertable<PlanCantine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_cantine_type')) {
      context.handle(
          _id_cantine_typeMeta,
          id_cantine_type.isAcceptableOrUnknown(
              data['id_cantine_type']!, _id_cantine_typeMeta));
    }
    if (data.containsKey('date_cantine')) {
      context.handle(
          _date_cantineMeta,
          date_cantine.isAcceptableOrUnknown(
              data['date_cantine']!, _date_cantineMeta));
    }
    if (data.containsKey('cantine_type_description')) {
      context.handle(
          _cantine_type_descriptionMeta,
          cantine_type_description.isAcceptableOrUnknown(
              data['cantine_type_description']!,
              _cantine_type_descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_cantine_type};
  @override
  PlanCantine map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PlanCantine.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlanCantinesTable createAlias(String alias) {
    return $PlanCantinesTable(attachedDatabase, alias);
  }
}

class Plat extends DataClass implements Insertable<Plat> {
  final int id;
  final String? cantine_type_repas_description;
  final String? plat;
  final int position;
  final int? id_cantine_type;
  Plat(
      {required this.id,
      this.cantine_type_repas_description,
      this.plat,
      required this.position,
      this.id_cantine_type});
  factory Plat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Plat(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      cantine_type_repas_description: const StringType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}cantine_type_repas_description']),
      plat: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}plat']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      id_cantine_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_cantine_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || cantine_type_repas_description != null) {
      map['cantine_type_repas_description'] =
          Variable<String?>(cantine_type_repas_description);
    }
    if (!nullToAbsent || plat != null) {
      map['plat'] = Variable<String?>(plat);
    }
    map['position'] = Variable<int>(position);
    if (!nullToAbsent || id_cantine_type != null) {
      map['id_cantine_type'] = Variable<int?>(id_cantine_type);
    }
    return map;
  }

  PlatsCompanion toCompanion(bool nullToAbsent) {
    return PlatsCompanion(
      id: Value(id),
      cantine_type_repas_description:
          cantine_type_repas_description == null && nullToAbsent
              ? const Value.absent()
              : Value(cantine_type_repas_description),
      plat: plat == null && nullToAbsent ? const Value.absent() : Value(plat),
      position: Value(position),
      id_cantine_type: id_cantine_type == null && nullToAbsent
          ? const Value.absent()
          : Value(id_cantine_type),
    );
  }

  factory Plat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Plat(
      id: serializer.fromJson<int>(json['id']),
      cantine_type_repas_description:
          serializer.fromJson<String?>(json['cantine_type_repas_description']),
      plat: serializer.fromJson<String?>(json['plat']),
      position: serializer.fromJson<int>(json['position']),
      id_cantine_type: serializer.fromJson<int?>(json['id_cantine_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cantine_type_repas_description':
          serializer.toJson<String?>(cantine_type_repas_description),
      'plat': serializer.toJson<String?>(plat),
      'position': serializer.toJson<int>(position),
      'id_cantine_type': serializer.toJson<int?>(id_cantine_type),
    };
  }

  Plat copyWith(
          {int? id,
          String? cantine_type_repas_description,
          String? plat,
          int? position,
          int? id_cantine_type}) =>
      Plat(
        id: id ?? this.id,
        cantine_type_repas_description: cantine_type_repas_description ??
            this.cantine_type_repas_description,
        plat: plat ?? this.plat,
        position: position ?? this.position,
        id_cantine_type: id_cantine_type ?? this.id_cantine_type,
      );
  @override
  String toString() {
    return (StringBuffer('Plat(')
          ..write('id: $id, ')
          ..write(
              'cantine_type_repas_description: $cantine_type_repas_description, ')
          ..write('plat: $plat, ')
          ..write('position: $position, ')
          ..write('id_cantine_type: $id_cantine_type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, cantine_type_repas_description, plat, position, id_cantine_type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plat &&
          other.id == this.id &&
          other.cantine_type_repas_description ==
              this.cantine_type_repas_description &&
          other.plat == this.plat &&
          other.position == this.position &&
          other.id_cantine_type == this.id_cantine_type);
}

class PlatsCompanion extends UpdateCompanion<Plat> {
  final Value<int> id;
  final Value<String?> cantine_type_repas_description;
  final Value<String?> plat;
  final Value<int> position;
  final Value<int?> id_cantine_type;
  const PlatsCompanion({
    this.id = const Value.absent(),
    this.cantine_type_repas_description = const Value.absent(),
    this.plat = const Value.absent(),
    this.position = const Value.absent(),
    this.id_cantine_type = const Value.absent(),
  });
  PlatsCompanion.insert({
    this.id = const Value.absent(),
    this.cantine_type_repas_description = const Value.absent(),
    this.plat = const Value.absent(),
    this.position = const Value.absent(),
    this.id_cantine_type = const Value.absent(),
  });
  static Insertable<Plat> custom({
    Expression<int>? id,
    Expression<String?>? cantine_type_repas_description,
    Expression<String?>? plat,
    Expression<int>? position,
    Expression<int?>? id_cantine_type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cantine_type_repas_description != null)
        'cantine_type_repas_description': cantine_type_repas_description,
      if (plat != null) 'plat': plat,
      if (position != null) 'position': position,
      if (id_cantine_type != null) 'id_cantine_type': id_cantine_type,
    });
  }

  PlatsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? cantine_type_repas_description,
      Value<String?>? plat,
      Value<int>? position,
      Value<int?>? id_cantine_type}) {
    return PlatsCompanion(
      id: id ?? this.id,
      cantine_type_repas_description:
          cantine_type_repas_description ?? this.cantine_type_repas_description,
      plat: plat ?? this.plat,
      position: position ?? this.position,
      id_cantine_type: id_cantine_type ?? this.id_cantine_type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cantine_type_repas_description.present) {
      map['cantine_type_repas_description'] =
          Variable<String?>(cantine_type_repas_description.value);
    }
    if (plat.present) {
      map['plat'] = Variable<String?>(plat.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (id_cantine_type.present) {
      map['id_cantine_type'] = Variable<int?>(id_cantine_type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlatsCompanion(')
          ..write('id: $id, ')
          ..write(
              'cantine_type_repas_description: $cantine_type_repas_description, ')
          ..write('plat: $plat, ')
          ..write('position: $position, ')
          ..write('id_cantine_type: $id_cantine_type')
          ..write(')'))
        .toString();
  }
}

class $PlatsTable extends Plats with TableInfo<$PlatsTable, Plat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlatsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _cantine_type_repas_descriptionMeta =
      const VerificationMeta('cantine_type_repas_description');
  @override
  late final GeneratedColumn<String?> cantine_type_repas_description =
      GeneratedColumn<String?>(
          'cantine_type_repas_description', aliasedName, true,
          type: const StringType(),
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  final VerificationMeta _platMeta = const VerificationMeta('plat');
  @override
  late final GeneratedColumn<String?> plat = GeneratedColumn<String?>(
      'plat', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _id_cantine_typeMeta =
      const VerificationMeta('id_cantine_type');
  @override
  late final GeneratedColumn<int?> id_cantine_type = GeneratedColumn<int?>(
      'id_cantine_type', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cantine_type_repas_description, plat, position, id_cantine_type];
  @override
  String get aliasedName => _alias ?? 'plats';
  @override
  String get actualTableName => 'plats';
  @override
  VerificationContext validateIntegrity(Insertable<Plat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cantine_type_repas_description')) {
      context.handle(
          _cantine_type_repas_descriptionMeta,
          cantine_type_repas_description.isAcceptableOrUnknown(
              data['cantine_type_repas_description']!,
              _cantine_type_repas_descriptionMeta));
    }
    if (data.containsKey('plat')) {
      context.handle(
          _platMeta, plat.isAcceptableOrUnknown(data['plat']!, _platMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('id_cantine_type')) {
      context.handle(
          _id_cantine_typeMeta,
          id_cantine_type.isAcceptableOrUnknown(
              data['id_cantine_type']!, _id_cantine_typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plat map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Plat.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlatsTable createAlias(String alias) {
    return $PlatsTable(attachedDatabase, alias);
  }
}

class Devoir extends DataClass implements Insertable<Devoir> {
  final int id_devoir;
  final int id_personne;
  final String? devoir_description;
  final String? devoir_detail;
  final String? matiere;
  final String? devoirtype;
  final String? devoirendrroit;
  final int position;
  final DateTime date_devoir;
  Devoir(
      {required this.id_devoir,
      required this.id_personne,
      this.devoir_description,
      this.devoir_detail,
      this.matiere,
      this.devoirtype,
      this.devoirendrroit,
      required this.position,
      required this.date_devoir});
  factory Devoir.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Devoir(
      id_devoir: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_devoir'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      devoir_description: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}devoir_description']),
      devoir_detail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}devoir_detail']),
      matiere: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}matiere']),
      devoirtype: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}devoirtype']),
      devoirendrroit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}devoirendrroit']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      date_devoir: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_devoir'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_devoir'] = Variable<int>(id_devoir);
    map['id_personne'] = Variable<int>(id_personne);
    if (!nullToAbsent || devoir_description != null) {
      map['devoir_description'] = Variable<String?>(devoir_description);
    }
    if (!nullToAbsent || devoir_detail != null) {
      map['devoir_detail'] = Variable<String?>(devoir_detail);
    }
    if (!nullToAbsent || matiere != null) {
      map['matiere'] = Variable<String?>(matiere);
    }
    if (!nullToAbsent || devoirtype != null) {
      map['devoirtype'] = Variable<String?>(devoirtype);
    }
    if (!nullToAbsent || devoirendrroit != null) {
      map['devoirendrroit'] = Variable<String?>(devoirendrroit);
    }
    map['position'] = Variable<int>(position);
    map['date_devoir'] = Variable<DateTime>(date_devoir);
    return map;
  }

  DevoirsCompanion toCompanion(bool nullToAbsent) {
    return DevoirsCompanion(
      id_devoir: Value(id_devoir),
      id_personne: Value(id_personne),
      devoir_description: devoir_description == null && nullToAbsent
          ? const Value.absent()
          : Value(devoir_description),
      devoir_detail: devoir_detail == null && nullToAbsent
          ? const Value.absent()
          : Value(devoir_detail),
      matiere: matiere == null && nullToAbsent
          ? const Value.absent()
          : Value(matiere),
      devoirtype: devoirtype == null && nullToAbsent
          ? const Value.absent()
          : Value(devoirtype),
      devoirendrroit: devoirendrroit == null && nullToAbsent
          ? const Value.absent()
          : Value(devoirendrroit),
      position: Value(position),
      date_devoir: Value(date_devoir),
    );
  }

  factory Devoir.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Devoir(
      id_devoir: serializer.fromJson<int>(json['id_devoir']),
      id_personne: serializer.fromJson<int>(json['id_personne']),
      devoir_description:
          serializer.fromJson<String?>(json['devoir_description']),
      devoir_detail: serializer.fromJson<String?>(json['devoir_detail']),
      matiere: serializer.fromJson<String?>(json['matiere']),
      devoirtype: serializer.fromJson<String?>(json['devoirtype']),
      devoirendrroit: serializer.fromJson<String?>(json['devoirendrroit']),
      position: serializer.fromJson<int>(json['position']),
      date_devoir: serializer.fromJson<DateTime>(json['date_devoir']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_devoir': serializer.toJson<int>(id_devoir),
      'id_personne': serializer.toJson<int>(id_personne),
      'devoir_description': serializer.toJson<String?>(devoir_description),
      'devoir_detail': serializer.toJson<String?>(devoir_detail),
      'matiere': serializer.toJson<String?>(matiere),
      'devoirtype': serializer.toJson<String?>(devoirtype),
      'devoirendrroit': serializer.toJson<String?>(devoirendrroit),
      'position': serializer.toJson<int>(position),
      'date_devoir': serializer.toJson<DateTime>(date_devoir),
    };
  }

  Devoir copyWith(
          {int? id_devoir,
          int? id_personne,
          String? devoir_description,
          String? devoir_detail,
          String? matiere,
          String? devoirtype,
          String? devoirendrroit,
          int? position,
          DateTime? date_devoir}) =>
      Devoir(
        id_devoir: id_devoir ?? this.id_devoir,
        id_personne: id_personne ?? this.id_personne,
        devoir_description: devoir_description ?? this.devoir_description,
        devoir_detail: devoir_detail ?? this.devoir_detail,
        matiere: matiere ?? this.matiere,
        devoirtype: devoirtype ?? this.devoirtype,
        devoirendrroit: devoirendrroit ?? this.devoirendrroit,
        position: position ?? this.position,
        date_devoir: date_devoir ?? this.date_devoir,
      );
  @override
  String toString() {
    return (StringBuffer('Devoir(')
          ..write('id_devoir: $id_devoir, ')
          ..write('id_personne: $id_personne, ')
          ..write('devoir_description: $devoir_description, ')
          ..write('devoir_detail: $devoir_detail, ')
          ..write('matiere: $matiere, ')
          ..write('devoirtype: $devoirtype, ')
          ..write('devoirendrroit: $devoirendrroit, ')
          ..write('position: $position, ')
          ..write('date_devoir: $date_devoir')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_devoir,
      id_personne,
      devoir_description,
      devoir_detail,
      matiere,
      devoirtype,
      devoirendrroit,
      position,
      date_devoir);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Devoir &&
          other.id_devoir == this.id_devoir &&
          other.id_personne == this.id_personne &&
          other.devoir_description == this.devoir_description &&
          other.devoir_detail == this.devoir_detail &&
          other.matiere == this.matiere &&
          other.devoirtype == this.devoirtype &&
          other.devoirendrroit == this.devoirendrroit &&
          other.position == this.position &&
          other.date_devoir == this.date_devoir);
}

class DevoirsCompanion extends UpdateCompanion<Devoir> {
  final Value<int> id_devoir;
  final Value<int> id_personne;
  final Value<String?> devoir_description;
  final Value<String?> devoir_detail;
  final Value<String?> matiere;
  final Value<String?> devoirtype;
  final Value<String?> devoirendrroit;
  final Value<int> position;
  final Value<DateTime> date_devoir;
  const DevoirsCompanion({
    this.id_devoir = const Value.absent(),
    this.id_personne = const Value.absent(),
    this.devoir_description = const Value.absent(),
    this.devoir_detail = const Value.absent(),
    this.matiere = const Value.absent(),
    this.devoirtype = const Value.absent(),
    this.devoirendrroit = const Value.absent(),
    this.position = const Value.absent(),
    this.date_devoir = const Value.absent(),
  });
  DevoirsCompanion.insert({
    this.id_devoir = const Value.absent(),
    required int id_personne,
    this.devoir_description = const Value.absent(),
    this.devoir_detail = const Value.absent(),
    this.matiere = const Value.absent(),
    this.devoirtype = const Value.absent(),
    this.devoirendrroit = const Value.absent(),
    required int position,
    this.date_devoir = const Value.absent(),
  })  : id_personne = Value(id_personne),
        position = Value(position);
  static Insertable<Devoir> custom({
    Expression<int>? id_devoir,
    Expression<int>? id_personne,
    Expression<String?>? devoir_description,
    Expression<String?>? devoir_detail,
    Expression<String?>? matiere,
    Expression<String?>? devoirtype,
    Expression<String?>? devoirendrroit,
    Expression<int>? position,
    Expression<DateTime>? date_devoir,
  }) {
    return RawValuesInsertable({
      if (id_devoir != null) 'id_devoir': id_devoir,
      if (id_personne != null) 'id_personne': id_personne,
      if (devoir_description != null) 'devoir_description': devoir_description,
      if (devoir_detail != null) 'devoir_detail': devoir_detail,
      if (matiere != null) 'matiere': matiere,
      if (devoirtype != null) 'devoirtype': devoirtype,
      if (devoirendrroit != null) 'devoirendrroit': devoirendrroit,
      if (position != null) 'position': position,
      if (date_devoir != null) 'date_devoir': date_devoir,
    });
  }

  DevoirsCompanion copyWith(
      {Value<int>? id_devoir,
      Value<int>? id_personne,
      Value<String?>? devoir_description,
      Value<String?>? devoir_detail,
      Value<String?>? matiere,
      Value<String?>? devoirtype,
      Value<String?>? devoirendrroit,
      Value<int>? position,
      Value<DateTime>? date_devoir}) {
    return DevoirsCompanion(
      id_devoir: id_devoir ?? this.id_devoir,
      id_personne: id_personne ?? this.id_personne,
      devoir_description: devoir_description ?? this.devoir_description,
      devoir_detail: devoir_detail ?? this.devoir_detail,
      matiere: matiere ?? this.matiere,
      devoirtype: devoirtype ?? this.devoirtype,
      devoirendrroit: devoirendrroit ?? this.devoirendrroit,
      position: position ?? this.position,
      date_devoir: date_devoir ?? this.date_devoir,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_devoir.present) {
      map['id_devoir'] = Variable<int>(id_devoir.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (devoir_description.present) {
      map['devoir_description'] = Variable<String?>(devoir_description.value);
    }
    if (devoir_detail.present) {
      map['devoir_detail'] = Variable<String?>(devoir_detail.value);
    }
    if (matiere.present) {
      map['matiere'] = Variable<String?>(matiere.value);
    }
    if (devoirtype.present) {
      map['devoirtype'] = Variable<String?>(devoirtype.value);
    }
    if (devoirendrroit.present) {
      map['devoirendrroit'] = Variable<String?>(devoirendrroit.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (date_devoir.present) {
      map['date_devoir'] = Variable<DateTime>(date_devoir.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevoirsCompanion(')
          ..write('id_devoir: $id_devoir, ')
          ..write('id_personne: $id_personne, ')
          ..write('devoir_description: $devoir_description, ')
          ..write('devoir_detail: $devoir_detail, ')
          ..write('matiere: $matiere, ')
          ..write('devoirtype: $devoirtype, ')
          ..write('devoirendrroit: $devoirendrroit, ')
          ..write('position: $position, ')
          ..write('date_devoir: $date_devoir')
          ..write(')'))
        .toString();
  }
}

class $DevoirsTable extends Devoirs with TableInfo<$DevoirsTable, Devoir> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevoirsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_devoirMeta = const VerificationMeta('id_devoir');
  @override
  late final GeneratedColumn<int?> id_devoir = GeneratedColumn<int?>(
      'id_devoir', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _devoir_descriptionMeta =
      const VerificationMeta('devoir_description');
  @override
  late final GeneratedColumn<String?> devoir_description =
      GeneratedColumn<String?>('devoir_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _devoir_detailMeta =
      const VerificationMeta('devoir_detail');
  @override
  late final GeneratedColumn<String?> devoir_detail = GeneratedColumn<String?>(
      'devoir_detail', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _matiereMeta = const VerificationMeta('matiere');
  @override
  late final GeneratedColumn<String?> matiere = GeneratedColumn<String?>(
      'matiere', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _devoirtypeMeta = const VerificationMeta('devoirtype');
  @override
  late final GeneratedColumn<String?> devoirtype = GeneratedColumn<String?>(
      'devoirtype', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _devoirendrroitMeta =
      const VerificationMeta('devoirendrroit');
  @override
  late final GeneratedColumn<String?> devoirendrroit = GeneratedColumn<String?>(
      'devoirendrroit', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _date_devoirMeta =
      const VerificationMeta('date_devoir');
  @override
  late final GeneratedColumn<DateTime?> date_devoir =
      GeneratedColumn<DateTime?>('date_devoir', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [
        id_devoir,
        id_personne,
        devoir_description,
        devoir_detail,
        matiere,
        devoirtype,
        devoirendrroit,
        position,
        date_devoir
      ];
  @override
  String get aliasedName => _alias ?? 'devoirs';
  @override
  String get actualTableName => 'devoirs';
  @override
  VerificationContext validateIntegrity(Insertable<Devoir> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_devoir')) {
      context.handle(_id_devoirMeta,
          id_devoir.isAcceptableOrUnknown(data['id_devoir']!, _id_devoirMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    } else if (isInserting) {
      context.missing(_id_personneMeta);
    }
    if (data.containsKey('devoir_description')) {
      context.handle(
          _devoir_descriptionMeta,
          devoir_description.isAcceptableOrUnknown(
              data['devoir_description']!, _devoir_descriptionMeta));
    }
    if (data.containsKey('devoir_detail')) {
      context.handle(
          _devoir_detailMeta,
          devoir_detail.isAcceptableOrUnknown(
              data['devoir_detail']!, _devoir_detailMeta));
    }
    if (data.containsKey('matiere')) {
      context.handle(_matiereMeta,
          matiere.isAcceptableOrUnknown(data['matiere']!, _matiereMeta));
    }
    if (data.containsKey('devoirtype')) {
      context.handle(
          _devoirtypeMeta,
          devoirtype.isAcceptableOrUnknown(
              data['devoirtype']!, _devoirtypeMeta));
    }
    if (data.containsKey('devoirendrroit')) {
      context.handle(
          _devoirendrroitMeta,
          devoirendrroit.isAcceptableOrUnknown(
              data['devoirendrroit']!, _devoirendrroitMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('date_devoir')) {
      context.handle(
          _date_devoirMeta,
          date_devoir.isAcceptableOrUnknown(
              data['date_devoir']!, _date_devoirMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_devoir};
  @override
  Devoir map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Devoir.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DevoirsTable createAlias(String alias) {
    return $DevoirsTable(attachedDatabase, alias);
  }
}

class DevoirPiecesjointe extends DataClass
    implements Insertable<DevoirPiecesjointe> {
  final int id_devoir_piece_jointe;
  final String? nom_original_piece_jointe;
  final String? lieu_piece_jointe;
  final int position;
  final int id_devoir;
  DevoirPiecesjointe(
      {required this.id_devoir_piece_jointe,
      this.nom_original_piece_jointe,
      this.lieu_piece_jointe,
      required this.position,
      required this.id_devoir});
  factory DevoirPiecesjointe.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DevoirPiecesjointe(
      id_devoir_piece_jointe: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_devoir_piece_jointe'])!,
      nom_original_piece_jointe: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}nom_original_piece_jointe']),
      lieu_piece_jointe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lieu_piece_jointe']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      id_devoir: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_devoir'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_devoir_piece_jointe'] = Variable<int>(id_devoir_piece_jointe);
    if (!nullToAbsent || nom_original_piece_jointe != null) {
      map['nom_original_piece_jointe'] =
          Variable<String?>(nom_original_piece_jointe);
    }
    if (!nullToAbsent || lieu_piece_jointe != null) {
      map['lieu_piece_jointe'] = Variable<String?>(lieu_piece_jointe);
    }
    map['position'] = Variable<int>(position);
    map['id_devoir'] = Variable<int>(id_devoir);
    return map;
  }

  DevoirPiecesjointesCompanion toCompanion(bool nullToAbsent) {
    return DevoirPiecesjointesCompanion(
      id_devoir_piece_jointe: Value(id_devoir_piece_jointe),
      nom_original_piece_jointe:
          nom_original_piece_jointe == null && nullToAbsent
              ? const Value.absent()
              : Value(nom_original_piece_jointe),
      lieu_piece_jointe: lieu_piece_jointe == null && nullToAbsent
          ? const Value.absent()
          : Value(lieu_piece_jointe),
      position: Value(position),
      id_devoir: Value(id_devoir),
    );
  }

  factory DevoirPiecesjointe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DevoirPiecesjointe(
      id_devoir_piece_jointe:
          serializer.fromJson<int>(json['id_devoir_piece_jointe']),
      nom_original_piece_jointe:
          serializer.fromJson<String?>(json['nom_original_piece_jointe']),
      lieu_piece_jointe:
          serializer.fromJson<String?>(json['lieu_piece_jointe']),
      position: serializer.fromJson<int>(json['position']),
      id_devoir: serializer.fromJson<int>(json['id_devoir']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_devoir_piece_jointe': serializer.toJson<int>(id_devoir_piece_jointe),
      'nom_original_piece_jointe':
          serializer.toJson<String?>(nom_original_piece_jointe),
      'lieu_piece_jointe': serializer.toJson<String?>(lieu_piece_jointe),
      'position': serializer.toJson<int>(position),
      'id_devoir': serializer.toJson<int>(id_devoir),
    };
  }

  DevoirPiecesjointe copyWith(
          {int? id_devoir_piece_jointe,
          String? nom_original_piece_jointe,
          String? lieu_piece_jointe,
          int? position,
          int? id_devoir}) =>
      DevoirPiecesjointe(
        id_devoir_piece_jointe:
            id_devoir_piece_jointe ?? this.id_devoir_piece_jointe,
        nom_original_piece_jointe:
            nom_original_piece_jointe ?? this.nom_original_piece_jointe,
        lieu_piece_jointe: lieu_piece_jointe ?? this.lieu_piece_jointe,
        position: position ?? this.position,
        id_devoir: id_devoir ?? this.id_devoir,
      );
  @override
  String toString() {
    return (StringBuffer('DevoirPiecesjointe(')
          ..write('id_devoir_piece_jointe: $id_devoir_piece_jointe, ')
          ..write('nom_original_piece_jointe: $nom_original_piece_jointe, ')
          ..write('lieu_piece_jointe: $lieu_piece_jointe, ')
          ..write('position: $position, ')
          ..write('id_devoir: $id_devoir')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_devoir_piece_jointe,
      nom_original_piece_jointe, lieu_piece_jointe, position, id_devoir);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DevoirPiecesjointe &&
          other.id_devoir_piece_jointe == this.id_devoir_piece_jointe &&
          other.nom_original_piece_jointe == this.nom_original_piece_jointe &&
          other.lieu_piece_jointe == this.lieu_piece_jointe &&
          other.position == this.position &&
          other.id_devoir == this.id_devoir);
}

class DevoirPiecesjointesCompanion extends UpdateCompanion<DevoirPiecesjointe> {
  final Value<int> id_devoir_piece_jointe;
  final Value<String?> nom_original_piece_jointe;
  final Value<String?> lieu_piece_jointe;
  final Value<int> position;
  final Value<int> id_devoir;
  const DevoirPiecesjointesCompanion({
    this.id_devoir_piece_jointe = const Value.absent(),
    this.nom_original_piece_jointe = const Value.absent(),
    this.lieu_piece_jointe = const Value.absent(),
    this.position = const Value.absent(),
    this.id_devoir = const Value.absent(),
  });
  DevoirPiecesjointesCompanion.insert({
    this.id_devoir_piece_jointe = const Value.absent(),
    this.nom_original_piece_jointe = const Value.absent(),
    this.lieu_piece_jointe = const Value.absent(),
    required int position,
    required int id_devoir,
  })  : position = Value(position),
        id_devoir = Value(id_devoir);
  static Insertable<DevoirPiecesjointe> custom({
    Expression<int>? id_devoir_piece_jointe,
    Expression<String?>? nom_original_piece_jointe,
    Expression<String?>? lieu_piece_jointe,
    Expression<int>? position,
    Expression<int>? id_devoir,
  }) {
    return RawValuesInsertable({
      if (id_devoir_piece_jointe != null)
        'id_devoir_piece_jointe': id_devoir_piece_jointe,
      if (nom_original_piece_jointe != null)
        'nom_original_piece_jointe': nom_original_piece_jointe,
      if (lieu_piece_jointe != null) 'lieu_piece_jointe': lieu_piece_jointe,
      if (position != null) 'position': position,
      if (id_devoir != null) 'id_devoir': id_devoir,
    });
  }

  DevoirPiecesjointesCompanion copyWith(
      {Value<int>? id_devoir_piece_jointe,
      Value<String?>? nom_original_piece_jointe,
      Value<String?>? lieu_piece_jointe,
      Value<int>? position,
      Value<int>? id_devoir}) {
    return DevoirPiecesjointesCompanion(
      id_devoir_piece_jointe:
          id_devoir_piece_jointe ?? this.id_devoir_piece_jointe,
      nom_original_piece_jointe:
          nom_original_piece_jointe ?? this.nom_original_piece_jointe,
      lieu_piece_jointe: lieu_piece_jointe ?? this.lieu_piece_jointe,
      position: position ?? this.position,
      id_devoir: id_devoir ?? this.id_devoir,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_devoir_piece_jointe.present) {
      map['id_devoir_piece_jointe'] =
          Variable<int>(id_devoir_piece_jointe.value);
    }
    if (nom_original_piece_jointe.present) {
      map['nom_original_piece_jointe'] =
          Variable<String?>(nom_original_piece_jointe.value);
    }
    if (lieu_piece_jointe.present) {
      map['lieu_piece_jointe'] = Variable<String?>(lieu_piece_jointe.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (id_devoir.present) {
      map['id_devoir'] = Variable<int>(id_devoir.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevoirPiecesjointesCompanion(')
          ..write('id_devoir_piece_jointe: $id_devoir_piece_jointe, ')
          ..write('nom_original_piece_jointe: $nom_original_piece_jointe, ')
          ..write('lieu_piece_jointe: $lieu_piece_jointe, ')
          ..write('position: $position, ')
          ..write('id_devoir: $id_devoir')
          ..write(')'))
        .toString();
  }
}

class $DevoirPiecesjointesTable extends DevoirPiecesjointes
    with TableInfo<$DevoirPiecesjointesTable, DevoirPiecesjointe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevoirPiecesjointesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_devoir_piece_jointeMeta =
      const VerificationMeta('id_devoir_piece_jointe');
  @override
  late final GeneratedColumn<int?> id_devoir_piece_jointe =
      GeneratedColumn<int?>('id_devoir_piece_jointe', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nom_original_piece_jointeMeta =
      const VerificationMeta('nom_original_piece_jointe');
  @override
  late final GeneratedColumn<String?> nom_original_piece_jointe =
      GeneratedColumn<String?>('nom_original_piece_jointe', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lieu_piece_jointeMeta =
      const VerificationMeta('lieu_piece_jointe');
  @override
  late final GeneratedColumn<String?> lieu_piece_jointe =
      GeneratedColumn<String?>('lieu_piece_jointe', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _id_devoirMeta = const VerificationMeta('id_devoir');
  @override
  late final GeneratedColumn<int?> id_devoir = GeneratedColumn<int?>(
      'id_devoir', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id_devoir_piece_jointe,
        nom_original_piece_jointe,
        lieu_piece_jointe,
        position,
        id_devoir
      ];
  @override
  String get aliasedName => _alias ?? 'devoir_piecesjointes';
  @override
  String get actualTableName => 'devoir_piecesjointes';
  @override
  VerificationContext validateIntegrity(Insertable<DevoirPiecesjointe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_devoir_piece_jointe')) {
      context.handle(
          _id_devoir_piece_jointeMeta,
          id_devoir_piece_jointe.isAcceptableOrUnknown(
              data['id_devoir_piece_jointe']!, _id_devoir_piece_jointeMeta));
    }
    if (data.containsKey('nom_original_piece_jointe')) {
      context.handle(
          _nom_original_piece_jointeMeta,
          nom_original_piece_jointe.isAcceptableOrUnknown(
              data['nom_original_piece_jointe']!,
              _nom_original_piece_jointeMeta));
    }
    if (data.containsKey('lieu_piece_jointe')) {
      context.handle(
          _lieu_piece_jointeMeta,
          lieu_piece_jointe.isAcceptableOrUnknown(
              data['lieu_piece_jointe']!, _lieu_piece_jointeMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('id_devoir')) {
      context.handle(_id_devoirMeta,
          id_devoir.isAcceptableOrUnknown(data['id_devoir']!, _id_devoirMeta));
    } else if (isInserting) {
      context.missing(_id_devoirMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_devoir_piece_jointe};
  @override
  DevoirPiecesjointe map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DevoirPiecesjointe.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DevoirPiecesjointesTable createAlias(String alias) {
    return $DevoirPiecesjointesTable(attachedDatabase, alias);
  }
}

class ParentNotification extends DataClass
    implements Insertable<ParentNotification> {
  final int id_parent_notification;
  final String titre;
  final String? detail;
  final DateTime date_de_notification;
  ParentNotification(
      {required this.id_parent_notification,
      required this.titre,
      this.detail,
      required this.date_de_notification});
  factory ParentNotification.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ParentNotification(
      id_parent_notification: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_parent_notification'])!,
      titre: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}titre'])!,
      detail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}detail']),
      date_de_notification: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_de_notification'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_parent_notification'] = Variable<int>(id_parent_notification);
    map['titre'] = Variable<String>(titre);
    if (!nullToAbsent || detail != null) {
      map['detail'] = Variable<String?>(detail);
    }
    map['date_de_notification'] = Variable<DateTime>(date_de_notification);
    return map;
  }

  ParentNotificationsCompanion toCompanion(bool nullToAbsent) {
    return ParentNotificationsCompanion(
      id_parent_notification: Value(id_parent_notification),
      titre: Value(titre),
      detail:
          detail == null && nullToAbsent ? const Value.absent() : Value(detail),
      date_de_notification: Value(date_de_notification),
    );
  }

  factory ParentNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ParentNotification(
      id_parent_notification:
          serializer.fromJson<int>(json['id_parent_notification']),
      titre: serializer.fromJson<String>(json['titre']),
      detail: serializer.fromJson<String?>(json['detail']),
      date_de_notification:
          serializer.fromJson<DateTime>(json['date_de_notification']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_parent_notification': serializer.toJson<int>(id_parent_notification),
      'titre': serializer.toJson<String>(titre),
      'detail': serializer.toJson<String?>(detail),
      'date_de_notification': serializer.toJson<DateTime>(date_de_notification),
    };
  }

  ParentNotification copyWith(
          {int? id_parent_notification,
          String? titre,
          String? detail,
          DateTime? date_de_notification}) =>
      ParentNotification(
        id_parent_notification:
            id_parent_notification ?? this.id_parent_notification,
        titre: titre ?? this.titre,
        detail: detail ?? this.detail,
        date_de_notification: date_de_notification ?? this.date_de_notification,
      );
  @override
  String toString() {
    return (StringBuffer('ParentNotification(')
          ..write('id_parent_notification: $id_parent_notification, ')
          ..write('titre: $titre, ')
          ..write('detail: $detail, ')
          ..write('date_de_notification: $date_de_notification')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id_parent_notification, titre, detail, date_de_notification);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParentNotification &&
          other.id_parent_notification == this.id_parent_notification &&
          other.titre == this.titre &&
          other.detail == this.detail &&
          other.date_de_notification == this.date_de_notification);
}

class ParentNotificationsCompanion extends UpdateCompanion<ParentNotification> {
  final Value<int> id_parent_notification;
  final Value<String> titre;
  final Value<String?> detail;
  final Value<DateTime> date_de_notification;
  const ParentNotificationsCompanion({
    this.id_parent_notification = const Value.absent(),
    this.titre = const Value.absent(),
    this.detail = const Value.absent(),
    this.date_de_notification = const Value.absent(),
  });
  ParentNotificationsCompanion.insert({
    this.id_parent_notification = const Value.absent(),
    this.titre = const Value.absent(),
    this.detail = const Value.absent(),
    required DateTime date_de_notification,
  }) : date_de_notification = Value(date_de_notification);
  static Insertable<ParentNotification> custom({
    Expression<int>? id_parent_notification,
    Expression<String>? titre,
    Expression<String?>? detail,
    Expression<DateTime>? date_de_notification,
  }) {
    return RawValuesInsertable({
      if (id_parent_notification != null)
        'id_parent_notification': id_parent_notification,
      if (titre != null) 'titre': titre,
      if (detail != null) 'detail': detail,
      if (date_de_notification != null)
        'date_de_notification': date_de_notification,
    });
  }

  ParentNotificationsCompanion copyWith(
      {Value<int>? id_parent_notification,
      Value<String>? titre,
      Value<String?>? detail,
      Value<DateTime>? date_de_notification}) {
    return ParentNotificationsCompanion(
      id_parent_notification:
          id_parent_notification ?? this.id_parent_notification,
      titre: titre ?? this.titre,
      detail: detail ?? this.detail,
      date_de_notification: date_de_notification ?? this.date_de_notification,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_parent_notification.present) {
      map['id_parent_notification'] =
          Variable<int>(id_parent_notification.value);
    }
    if (titre.present) {
      map['titre'] = Variable<String>(titre.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String?>(detail.value);
    }
    if (date_de_notification.present) {
      map['date_de_notification'] =
          Variable<DateTime>(date_de_notification.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParentNotificationsCompanion(')
          ..write('id_parent_notification: $id_parent_notification, ')
          ..write('titre: $titre, ')
          ..write('detail: $detail, ')
          ..write('date_de_notification: $date_de_notification')
          ..write(')'))
        .toString();
  }
}

class $ParentNotificationsTable extends ParentNotifications
    with TableInfo<$ParentNotificationsTable, ParentNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParentNotificationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_parent_notificationMeta =
      const VerificationMeta('id_parent_notification');
  @override
  late final GeneratedColumn<int?> id_parent_notification =
      GeneratedColumn<int?>('id_parent_notification', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _titreMeta = const VerificationMeta('titre');
  @override
  late final GeneratedColumn<String?> titre = GeneratedColumn<String?>(
      'titre', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String?> detail = GeneratedColumn<String?>(
      'detail', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _date_de_notificationMeta =
      const VerificationMeta('date_de_notification');
  @override
  late final GeneratedColumn<DateTime?> date_de_notification =
      GeneratedColumn<DateTime?>('date_de_notification', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id_parent_notification, titre, detail, date_de_notification];
  @override
  String get aliasedName => _alias ?? 'parent_notifications';
  @override
  String get actualTableName => 'parent_notifications';
  @override
  VerificationContext validateIntegrity(Insertable<ParentNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_parent_notification')) {
      context.handle(
          _id_parent_notificationMeta,
          id_parent_notification.isAcceptableOrUnknown(
              data['id_parent_notification']!, _id_parent_notificationMeta));
    }
    if (data.containsKey('titre')) {
      context.handle(
          _titreMeta, titre.isAcceptableOrUnknown(data['titre']!, _titreMeta));
    }
    if (data.containsKey('detail')) {
      context.handle(_detailMeta,
          detail.isAcceptableOrUnknown(data['detail']!, _detailMeta));
    }
    if (data.containsKey('date_de_notification')) {
      context.handle(
          _date_de_notificationMeta,
          date_de_notification.isAcceptableOrUnknown(
              data['date_de_notification']!, _date_de_notificationMeta));
    } else if (isInserting) {
      context.missing(_date_de_notificationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_parent_notification};
  @override
  ParentNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ParentNotification.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ParentNotificationsTable createAlias(String alias) {
    return $ParentNotificationsTable(attachedDatabase, alias);
  }
}

class CountJoursFerie extends DataClass implements Insertable<CountJoursFerie> {
  final int idJoursFeries;
  final int? id_personne;
  CountJoursFerie({required this.idJoursFeries, this.id_personne});
  factory CountJoursFerie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CountJoursFerie(
      idJoursFeries: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_jours_feries'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_jours_feries'] = Variable<int>(idJoursFeries);
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    return map;
  }

  CountJoursFeriesCompanion toCompanion(bool nullToAbsent) {
    return CountJoursFeriesCompanion(
      idJoursFeries: Value(idJoursFeries),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
    );
  }

  factory CountJoursFerie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountJoursFerie(
      idJoursFeries: serializer.fromJson<int>(json['idJoursFeries']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idJoursFeries': serializer.toJson<int>(idJoursFeries),
      'id_personne': serializer.toJson<int?>(id_personne),
    };
  }

  CountJoursFerie copyWith({int? idJoursFeries, int? id_personne}) =>
      CountJoursFerie(
        idJoursFeries: idJoursFeries ?? this.idJoursFeries,
        id_personne: id_personne ?? this.id_personne,
      );
  @override
  String toString() {
    return (StringBuffer('CountJoursFerie(')
          ..write('idJoursFeries: $idJoursFeries, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idJoursFeries, id_personne);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountJoursFerie &&
          other.idJoursFeries == this.idJoursFeries &&
          other.id_personne == this.id_personne);
}

class CountJoursFeriesCompanion extends UpdateCompanion<CountJoursFerie> {
  final Value<int> idJoursFeries;
  final Value<int?> id_personne;
  const CountJoursFeriesCompanion({
    this.idJoursFeries = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  CountJoursFeriesCompanion.insert({
    this.idJoursFeries = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  static Insertable<CountJoursFerie> custom({
    Expression<int>? idJoursFeries,
    Expression<int?>? id_personne,
  }) {
    return RawValuesInsertable({
      if (idJoursFeries != null) 'id_jours_feries': idJoursFeries,
      if (id_personne != null) 'id_personne': id_personne,
    });
  }

  CountJoursFeriesCompanion copyWith(
      {Value<int>? idJoursFeries, Value<int?>? id_personne}) {
    return CountJoursFeriesCompanion(
      idJoursFeries: idJoursFeries ?? this.idJoursFeries,
      id_personne: id_personne ?? this.id_personne,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idJoursFeries.present) {
      map['id_jours_feries'] = Variable<int>(idJoursFeries.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountJoursFeriesCompanion(')
          ..write('idJoursFeries: $idJoursFeries, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }
}

class $CountJoursFeriesTable extends CountJoursFeries
    with TableInfo<$CountJoursFeriesTable, CountJoursFerie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountJoursFeriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idJoursFeriesMeta =
      const VerificationMeta('idJoursFeries');
  @override
  late final GeneratedColumn<int?> idJoursFeries = GeneratedColumn<int?>(
      'id_jours_feries', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [idJoursFeries, id_personne];
  @override
  String get aliasedName => _alias ?? 'count_jours_feries';
  @override
  String get actualTableName => 'count_jours_feries';
  @override
  VerificationContext validateIntegrity(Insertable<CountJoursFerie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_jours_feries')) {
      context.handle(
          _idJoursFeriesMeta,
          idJoursFeries.isAcceptableOrUnknown(
              data['id_jours_feries']!, _idJoursFeriesMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idJoursFeries};
  @override
  CountJoursFerie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CountJoursFerie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CountJoursFeriesTable createAlias(String alias) {
    return $CountJoursFeriesTable(attachedDatabase, alias);
  }
}

class CountNotification extends DataClass
    implements Insertable<CountNotification> {
  final int idNotifications;
  CountNotification({required this.idNotifications});
  factory CountNotification.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CountNotification(
      idNotifications: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_notifications'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_notifications'] = Variable<int>(idNotifications);
    return map;
  }

  CountNotificationsCompanion toCompanion(bool nullToAbsent) {
    return CountNotificationsCompanion(
      idNotifications: Value(idNotifications),
    );
  }

  factory CountNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountNotification(
      idNotifications: serializer.fromJson<int>(json['idNotifications']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idNotifications': serializer.toJson<int>(idNotifications),
    };
  }

  CountNotification copyWith({int? idNotifications}) => CountNotification(
        idNotifications: idNotifications ?? this.idNotifications,
      );
  @override
  String toString() {
    return (StringBuffer('CountNotification(')
          ..write('idNotifications: $idNotifications')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => idNotifications.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountNotification &&
          other.idNotifications == this.idNotifications);
}

class CountNotificationsCompanion extends UpdateCompanion<CountNotification> {
  final Value<int> idNotifications;
  const CountNotificationsCompanion({
    this.idNotifications = const Value.absent(),
  });
  CountNotificationsCompanion.insert({
    this.idNotifications = const Value.absent(),
  });
  static Insertable<CountNotification> custom({
    Expression<int>? idNotifications,
  }) {
    return RawValuesInsertable({
      if (idNotifications != null) 'id_notifications': idNotifications,
    });
  }

  CountNotificationsCompanion copyWith({Value<int>? idNotifications}) {
    return CountNotificationsCompanion(
      idNotifications: idNotifications ?? this.idNotifications,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idNotifications.present) {
      map['id_notifications'] = Variable<int>(idNotifications.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountNotificationsCompanion(')
          ..write('idNotifications: $idNotifications')
          ..write(')'))
        .toString();
  }
}

class $CountNotificationsTable extends CountNotifications
    with TableInfo<$CountNotificationsTable, CountNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountNotificationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idNotificationsMeta =
      const VerificationMeta('idNotifications');
  @override
  late final GeneratedColumn<int?> idNotifications = GeneratedColumn<int?>(
      'id_notifications', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [idNotifications];
  @override
  String get aliasedName => _alias ?? 'count_notifications';
  @override
  String get actualTableName => 'count_notifications';
  @override
  VerificationContext validateIntegrity(Insertable<CountNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_notifications')) {
      context.handle(
          _idNotificationsMeta,
          idNotifications.isAcceptableOrUnknown(
              data['id_notifications']!, _idNotificationsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idNotifications};
  @override
  CountNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CountNotification.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CountNotificationsTable createAlias(String alias) {
    return $CountNotificationsTable(attachedDatabase, alias);
  }
}

class CountInformation extends DataClass
    implements Insertable<CountInformation> {
  final int idInformation;
  final int? id_personne;
  CountInformation({required this.idInformation, this.id_personne});
  factory CountInformation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CountInformation(
      idInformation: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_information'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_information'] = Variable<int>(idInformation);
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    return map;
  }

  CountInformationsCompanion toCompanion(bool nullToAbsent) {
    return CountInformationsCompanion(
      idInformation: Value(idInformation),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
    );
  }

  factory CountInformation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountInformation(
      idInformation: serializer.fromJson<int>(json['idInformation']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idInformation': serializer.toJson<int>(idInformation),
      'id_personne': serializer.toJson<int?>(id_personne),
    };
  }

  CountInformation copyWith({int? idInformation, int? id_personne}) =>
      CountInformation(
        idInformation: idInformation ?? this.idInformation,
        id_personne: id_personne ?? this.id_personne,
      );
  @override
  String toString() {
    return (StringBuffer('CountInformation(')
          ..write('idInformation: $idInformation, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idInformation, id_personne);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountInformation &&
          other.idInformation == this.idInformation &&
          other.id_personne == this.id_personne);
}

class CountInformationsCompanion extends UpdateCompanion<CountInformation> {
  final Value<int> idInformation;
  final Value<int?> id_personne;
  const CountInformationsCompanion({
    this.idInformation = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  CountInformationsCompanion.insert({
    this.idInformation = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  static Insertable<CountInformation> custom({
    Expression<int>? idInformation,
    Expression<int?>? id_personne,
  }) {
    return RawValuesInsertable({
      if (idInformation != null) 'id_information': idInformation,
      if (id_personne != null) 'id_personne': id_personne,
    });
  }

  CountInformationsCompanion copyWith(
      {Value<int>? idInformation, Value<int?>? id_personne}) {
    return CountInformationsCompanion(
      idInformation: idInformation ?? this.idInformation,
      id_personne: id_personne ?? this.id_personne,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idInformation.present) {
      map['id_information'] = Variable<int>(idInformation.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountInformationsCompanion(')
          ..write('idInformation: $idInformation, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }
}

class $CountInformationsTable extends CountInformations
    with TableInfo<$CountInformationsTable, CountInformation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountInformationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idInformationMeta =
      const VerificationMeta('idInformation');
  @override
  late final GeneratedColumn<int?> idInformation = GeneratedColumn<int?>(
      'id_information', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [idInformation, id_personne];
  @override
  String get aliasedName => _alias ?? 'count_informations';
  @override
  String get actualTableName => 'count_informations';
  @override
  VerificationContext validateIntegrity(Insertable<CountInformation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_information')) {
      context.handle(
          _idInformationMeta,
          idInformation.isAcceptableOrUnknown(
              data['id_information']!, _idInformationMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idInformation};
  @override
  CountInformation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CountInformation.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CountInformationsTable createAlias(String alias) {
    return $CountInformationsTable(attachedDatabase, alias);
  }
}

class CountEvenement extends DataClass implements Insertable<CountEvenement> {
  final int idEvenement;
  final int? id_personne;
  CountEvenement({required this.idEvenement, this.id_personne});
  factory CountEvenement.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CountEvenement(
      idEvenement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_evenement'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_evenement'] = Variable<int>(idEvenement);
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    return map;
  }

  CountEvenementsCompanion toCompanion(bool nullToAbsent) {
    return CountEvenementsCompanion(
      idEvenement: Value(idEvenement),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
    );
  }

  factory CountEvenement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountEvenement(
      idEvenement: serializer.fromJson<int>(json['idEvenement']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEvenement': serializer.toJson<int>(idEvenement),
      'id_personne': serializer.toJson<int?>(id_personne),
    };
  }

  CountEvenement copyWith({int? idEvenement, int? id_personne}) =>
      CountEvenement(
        idEvenement: idEvenement ?? this.idEvenement,
        id_personne: id_personne ?? this.id_personne,
      );
  @override
  String toString() {
    return (StringBuffer('CountEvenement(')
          ..write('idEvenement: $idEvenement, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idEvenement, id_personne);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountEvenement &&
          other.idEvenement == this.idEvenement &&
          other.id_personne == this.id_personne);
}

class CountEvenementsCompanion extends UpdateCompanion<CountEvenement> {
  final Value<int> idEvenement;
  final Value<int?> id_personne;
  const CountEvenementsCompanion({
    this.idEvenement = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  CountEvenementsCompanion.insert({
    this.idEvenement = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  static Insertable<CountEvenement> custom({
    Expression<int>? idEvenement,
    Expression<int?>? id_personne,
  }) {
    return RawValuesInsertable({
      if (idEvenement != null) 'id_evenement': idEvenement,
      if (id_personne != null) 'id_personne': id_personne,
    });
  }

  CountEvenementsCompanion copyWith(
      {Value<int>? idEvenement, Value<int?>? id_personne}) {
    return CountEvenementsCompanion(
      idEvenement: idEvenement ?? this.idEvenement,
      id_personne: id_personne ?? this.id_personne,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEvenement.present) {
      map['id_evenement'] = Variable<int>(idEvenement.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountEvenementsCompanion(')
          ..write('idEvenement: $idEvenement, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }
}

class $CountEvenementsTable extends CountEvenements
    with TableInfo<$CountEvenementsTable, CountEvenement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountEvenementsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idEvenementMeta =
      const VerificationMeta('idEvenement');
  @override
  late final GeneratedColumn<int?> idEvenement = GeneratedColumn<int?>(
      'id_evenement', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [idEvenement, id_personne];
  @override
  String get aliasedName => _alias ?? 'count_evenements';
  @override
  String get actualTableName => 'count_evenements';
  @override
  VerificationContext validateIntegrity(Insertable<CountEvenement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_evenement')) {
      context.handle(
          _idEvenementMeta,
          idEvenement.isAcceptableOrUnknown(
              data['id_evenement']!, _idEvenementMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idEvenement};
  @override
  CountEvenement map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CountEvenement.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CountEvenementsTable createAlias(String alias) {
    return $CountEvenementsTable(attachedDatabase, alias);
  }
}

class Recuperation extends DataClass implements Insertable<Recuperation> {
  final int id_eleve_recuperations;
  final int? id_personne_parent;
  final int? id_personne_eleve;
  final String? parentnom;
  final DateTime date_de_la_demande;
  Recuperation(
      {required this.id_eleve_recuperations,
      this.id_personne_parent,
      this.id_personne_eleve,
      this.parentnom,
      required this.date_de_la_demande});
  factory Recuperation.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Recuperation(
      id_eleve_recuperations: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_eleve_recuperations'])!,
      id_personne_parent: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_personne_parent']),
      id_personne_eleve: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne_eleve']),
      parentnom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parentnom']),
      date_de_la_demande: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_de_la_demande'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_eleve_recuperations'] = Variable<int>(id_eleve_recuperations);
    if (!nullToAbsent || id_personne_parent != null) {
      map['id_personne_parent'] = Variable<int?>(id_personne_parent);
    }
    if (!nullToAbsent || id_personne_eleve != null) {
      map['id_personne_eleve'] = Variable<int?>(id_personne_eleve);
    }
    if (!nullToAbsent || parentnom != null) {
      map['parentnom'] = Variable<String?>(parentnom);
    }
    map['date_de_la_demande'] = Variable<DateTime>(date_de_la_demande);
    return map;
  }

  RecuperationsCompanion toCompanion(bool nullToAbsent) {
    return RecuperationsCompanion(
      id_eleve_recuperations: Value(id_eleve_recuperations),
      id_personne_parent: id_personne_parent == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne_parent),
      id_personne_eleve: id_personne_eleve == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne_eleve),
      parentnom: parentnom == null && nullToAbsent
          ? const Value.absent()
          : Value(parentnom),
      date_de_la_demande: Value(date_de_la_demande),
    );
  }

  factory Recuperation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Recuperation(
      id_eleve_recuperations:
          serializer.fromJson<int>(json['id_eleve_recuperations']),
      id_personne_parent: serializer.fromJson<int?>(json['id_personne_parent']),
      id_personne_eleve: serializer.fromJson<int?>(json['id_personne_eleve']),
      parentnom: serializer.fromJson<String?>(json['parentnom']),
      date_de_la_demande:
          serializer.fromJson<DateTime>(json['date_de_la_demande']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_eleve_recuperations': serializer.toJson<int>(id_eleve_recuperations),
      'id_personne_parent': serializer.toJson<int?>(id_personne_parent),
      'id_personne_eleve': serializer.toJson<int?>(id_personne_eleve),
      'parentnom': serializer.toJson<String?>(parentnom),
      'date_de_la_demande': serializer.toJson<DateTime>(date_de_la_demande),
    };
  }

  Recuperation copyWith(
          {int? id_eleve_recuperations,
          int? id_personne_parent,
          int? id_personne_eleve,
          String? parentnom,
          DateTime? date_de_la_demande}) =>
      Recuperation(
        id_eleve_recuperations:
            id_eleve_recuperations ?? this.id_eleve_recuperations,
        id_personne_parent: id_personne_parent ?? this.id_personne_parent,
        id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
        parentnom: parentnom ?? this.parentnom,
        date_de_la_demande: date_de_la_demande ?? this.date_de_la_demande,
      );
  @override
  String toString() {
    return (StringBuffer('Recuperation(')
          ..write('id_eleve_recuperations: $id_eleve_recuperations, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('parentnom: $parentnom, ')
          ..write('date_de_la_demande: $date_de_la_demande')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_eleve_recuperations, id_personne_parent,
      id_personne_eleve, parentnom, date_de_la_demande);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recuperation &&
          other.id_eleve_recuperations == this.id_eleve_recuperations &&
          other.id_personne_parent == this.id_personne_parent &&
          other.id_personne_eleve == this.id_personne_eleve &&
          other.parentnom == this.parentnom &&
          other.date_de_la_demande == this.date_de_la_demande);
}

class RecuperationsCompanion extends UpdateCompanion<Recuperation> {
  final Value<int> id_eleve_recuperations;
  final Value<int?> id_personne_parent;
  final Value<int?> id_personne_eleve;
  final Value<String?> parentnom;
  final Value<DateTime> date_de_la_demande;
  const RecuperationsCompanion({
    this.id_eleve_recuperations = const Value.absent(),
    this.id_personne_parent = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.parentnom = const Value.absent(),
    this.date_de_la_demande = const Value.absent(),
  });
  RecuperationsCompanion.insert({
    this.id_eleve_recuperations = const Value.absent(),
    this.id_personne_parent = const Value.absent(),
    this.id_personne_eleve = const Value.absent(),
    this.parentnom = const Value.absent(),
    this.date_de_la_demande = const Value.absent(),
  });
  static Insertable<Recuperation> custom({
    Expression<int>? id_eleve_recuperations,
    Expression<int?>? id_personne_parent,
    Expression<int?>? id_personne_eleve,
    Expression<String?>? parentnom,
    Expression<DateTime>? date_de_la_demande,
  }) {
    return RawValuesInsertable({
      if (id_eleve_recuperations != null)
        'id_eleve_recuperations': id_eleve_recuperations,
      if (id_personne_parent != null) 'id_personne_parent': id_personne_parent,
      if (id_personne_eleve != null) 'id_personne_eleve': id_personne_eleve,
      if (parentnom != null) 'parentnom': parentnom,
      if (date_de_la_demande != null) 'date_de_la_demande': date_de_la_demande,
    });
  }

  RecuperationsCompanion copyWith(
      {Value<int>? id_eleve_recuperations,
      Value<int?>? id_personne_parent,
      Value<int?>? id_personne_eleve,
      Value<String?>? parentnom,
      Value<DateTime>? date_de_la_demande}) {
    return RecuperationsCompanion(
      id_eleve_recuperations:
          id_eleve_recuperations ?? this.id_eleve_recuperations,
      id_personne_parent: id_personne_parent ?? this.id_personne_parent,
      id_personne_eleve: id_personne_eleve ?? this.id_personne_eleve,
      parentnom: parentnom ?? this.parentnom,
      date_de_la_demande: date_de_la_demande ?? this.date_de_la_demande,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_eleve_recuperations.present) {
      map['id_eleve_recuperations'] =
          Variable<int>(id_eleve_recuperations.value);
    }
    if (id_personne_parent.present) {
      map['id_personne_parent'] = Variable<int?>(id_personne_parent.value);
    }
    if (id_personne_eleve.present) {
      map['id_personne_eleve'] = Variable<int?>(id_personne_eleve.value);
    }
    if (parentnom.present) {
      map['parentnom'] = Variable<String?>(parentnom.value);
    }
    if (date_de_la_demande.present) {
      map['date_de_la_demande'] = Variable<DateTime>(date_de_la_demande.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecuperationsCompanion(')
          ..write('id_eleve_recuperations: $id_eleve_recuperations, ')
          ..write('id_personne_parent: $id_personne_parent, ')
          ..write('id_personne_eleve: $id_personne_eleve, ')
          ..write('parentnom: $parentnom, ')
          ..write('date_de_la_demande: $date_de_la_demande')
          ..write(')'))
        .toString();
  }
}

class $RecuperationsTable extends Recuperations
    with TableInfo<$RecuperationsTable, Recuperation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecuperationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_eleve_recuperationsMeta =
      const VerificationMeta('id_eleve_recuperations');
  @override
  late final GeneratedColumn<int?> id_eleve_recuperations =
      GeneratedColumn<int?>('id_eleve_recuperations', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_parentMeta =
      const VerificationMeta('id_personne_parent');
  @override
  late final GeneratedColumn<int?> id_personne_parent = GeneratedColumn<int?>(
      'id_personne_parent', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personne_eleveMeta =
      const VerificationMeta('id_personne_eleve');
  @override
  late final GeneratedColumn<int?> id_personne_eleve = GeneratedColumn<int?>(
      'id_personne_eleve', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _parentnomMeta = const VerificationMeta('parentnom');
  @override
  late final GeneratedColumn<String?> parentnom = GeneratedColumn<String?>(
      'parentnom', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _date_de_la_demandeMeta =
      const VerificationMeta('date_de_la_demande');
  @override
  late final GeneratedColumn<DateTime?> date_de_la_demande =
      GeneratedColumn<DateTime?>('date_de_la_demande', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [
        id_eleve_recuperations,
        id_personne_parent,
        id_personne_eleve,
        parentnom,
        date_de_la_demande
      ];
  @override
  String get aliasedName => _alias ?? 'recuperations';
  @override
  String get actualTableName => 'recuperations';
  @override
  VerificationContext validateIntegrity(Insertable<Recuperation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_eleve_recuperations')) {
      context.handle(
          _id_eleve_recuperationsMeta,
          id_eleve_recuperations.isAcceptableOrUnknown(
              data['id_eleve_recuperations']!, _id_eleve_recuperationsMeta));
    }
    if (data.containsKey('id_personne_parent')) {
      context.handle(
          _id_personne_parentMeta,
          id_personne_parent.isAcceptableOrUnknown(
              data['id_personne_parent']!, _id_personne_parentMeta));
    }
    if (data.containsKey('id_personne_eleve')) {
      context.handle(
          _id_personne_eleveMeta,
          id_personne_eleve.isAcceptableOrUnknown(
              data['id_personne_eleve']!, _id_personne_eleveMeta));
    }
    if (data.containsKey('parentnom')) {
      context.handle(_parentnomMeta,
          parentnom.isAcceptableOrUnknown(data['parentnom']!, _parentnomMeta));
    }
    if (data.containsKey('date_de_la_demande')) {
      context.handle(
          _date_de_la_demandeMeta,
          date_de_la_demande.isAcceptableOrUnknown(
              data['date_de_la_demande']!, _date_de_la_demandeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_eleve_recuperations};
  @override
  Recuperation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Recuperation.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RecuperationsTable createAlias(String alias) {
    return $RecuperationsTable(attachedDatabase, alias);
  }
}

class CountSondage extends DataClass implements Insertable<CountSondage> {
  final int idSondage;
  final int? id_personne;
  CountSondage({required this.idSondage, this.id_personne});
  factory CountSondage.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CountSondage(
      idSondage: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_sondage'])!,
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_sondage'] = Variable<int>(idSondage);
    if (!nullToAbsent || id_personne != null) {
      map['id_personne'] = Variable<int?>(id_personne);
    }
    return map;
  }

  CountSondagesCompanion toCompanion(bool nullToAbsent) {
    return CountSondagesCompanion(
      idSondage: Value(idSondage),
      id_personne: id_personne == null && nullToAbsent
          ? const Value.absent()
          : Value(id_personne),
    );
  }

  factory CountSondage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountSondage(
      idSondage: serializer.fromJson<int>(json['idSondage']),
      id_personne: serializer.fromJson<int?>(json['id_personne']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idSondage': serializer.toJson<int>(idSondage),
      'id_personne': serializer.toJson<int?>(id_personne),
    };
  }

  CountSondage copyWith({int? idSondage, int? id_personne}) => CountSondage(
        idSondage: idSondage ?? this.idSondage,
        id_personne: id_personne ?? this.id_personne,
      );
  @override
  String toString() {
    return (StringBuffer('CountSondage(')
          ..write('idSondage: $idSondage, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idSondage, id_personne);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountSondage &&
          other.idSondage == this.idSondage &&
          other.id_personne == this.id_personne);
}

class CountSondagesCompanion extends UpdateCompanion<CountSondage> {
  final Value<int> idSondage;
  final Value<int?> id_personne;
  const CountSondagesCompanion({
    this.idSondage = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  CountSondagesCompanion.insert({
    this.idSondage = const Value.absent(),
    this.id_personne = const Value.absent(),
  });
  static Insertable<CountSondage> custom({
    Expression<int>? idSondage,
    Expression<int?>? id_personne,
  }) {
    return RawValuesInsertable({
      if (idSondage != null) 'id_sondage': idSondage,
      if (id_personne != null) 'id_personne': id_personne,
    });
  }

  CountSondagesCompanion copyWith(
      {Value<int>? idSondage, Value<int?>? id_personne}) {
    return CountSondagesCompanion(
      idSondage: idSondage ?? this.idSondage,
      id_personne: id_personne ?? this.id_personne,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idSondage.present) {
      map['id_sondage'] = Variable<int>(idSondage.value);
    }
    if (id_personne.present) {
      map['id_personne'] = Variable<int?>(id_personne.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountSondagesCompanion(')
          ..write('idSondage: $idSondage, ')
          ..write('id_personne: $id_personne')
          ..write(')'))
        .toString();
  }
}

class $CountSondagesTable extends CountSondages
    with TableInfo<$CountSondagesTable, CountSondage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountSondagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idSondageMeta = const VerificationMeta('idSondage');
  @override
  late final GeneratedColumn<int?> idSondage = GeneratedColumn<int?>(
      'id_sondage', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [idSondage, id_personne];
  @override
  String get aliasedName => _alias ?? 'count_sondages';
  @override
  String get actualTableName => 'count_sondages';
  @override
  VerificationContext validateIntegrity(Insertable<CountSondage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_sondage')) {
      context.handle(_idSondageMeta,
          idSondage.isAcceptableOrUnknown(data['id_sondage']!, _idSondageMeta));
    }
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idSondage};
  @override
  CountSondage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CountSondage.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CountSondagesTable createAlias(String alias) {
    return $CountSondagesTable(attachedDatabase, alias);
  }
}

class Counter extends DataClass implements Insertable<Counter> {
  final int id_personne;
  final int count_jours_feries;
  final int count_evenements;
  final int count_informations;
  final int count_sondages;
  final int count_notifications;
  Counter(
      {required this.id_personne,
      required this.count_jours_feries,
      required this.count_evenements,
      required this.count_informations,
      required this.count_sondages,
      required this.count_notifications});
  factory Counter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Counter(
      id_personne: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_personne'])!,
      count_jours_feries: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}count_jours_feries'])!,
      count_evenements: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}count_evenements'])!,
      count_informations: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}count_informations'])!,
      count_sondages: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}count_sondages'])!,
      count_notifications: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}count_notifications'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_personne'] = Variable<int>(id_personne);
    map['count_jours_feries'] = Variable<int>(count_jours_feries);
    map['count_evenements'] = Variable<int>(count_evenements);
    map['count_informations'] = Variable<int>(count_informations);
    map['count_sondages'] = Variable<int>(count_sondages);
    map['count_notifications'] = Variable<int>(count_notifications);
    return map;
  }

  CountersCompanion toCompanion(bool nullToAbsent) {
    return CountersCompanion(
      id_personne: Value(id_personne),
      count_jours_feries: Value(count_jours_feries),
      count_evenements: Value(count_evenements),
      count_informations: Value(count_informations),
      count_sondages: Value(count_sondages),
      count_notifications: Value(count_notifications),
    );
  }

  factory Counter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Counter(
      id_personne: serializer.fromJson<int>(json['id_personne']),
      count_jours_feries: serializer.fromJson<int>(json['count_jours_feries']),
      count_evenements: serializer.fromJson<int>(json['count_evenements']),
      count_informations: serializer.fromJson<int>(json['count_informations']),
      count_sondages: serializer.fromJson<int>(json['count_sondages']),
      count_notifications:
          serializer.fromJson<int>(json['count_notifications']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_personne': serializer.toJson<int>(id_personne),
      'count_jours_feries': serializer.toJson<int>(count_jours_feries),
      'count_evenements': serializer.toJson<int>(count_evenements),
      'count_informations': serializer.toJson<int>(count_informations),
      'count_sondages': serializer.toJson<int>(count_sondages),
      'count_notifications': serializer.toJson<int>(count_notifications),
    };
  }

  Counter copyWith(
          {int? id_personne,
          int? count_jours_feries,
          int? count_evenements,
          int? count_informations,
          int? count_sondages,
          int? count_notifications}) =>
      Counter(
        id_personne: id_personne ?? this.id_personne,
        count_jours_feries: count_jours_feries ?? this.count_jours_feries,
        count_evenements: count_evenements ?? this.count_evenements,
        count_informations: count_informations ?? this.count_informations,
        count_sondages: count_sondages ?? this.count_sondages,
        count_notifications: count_notifications ?? this.count_notifications,
      );
  @override
  String toString() {
    return (StringBuffer('Counter(')
          ..write('id_personne: $id_personne, ')
          ..write('count_jours_feries: $count_jours_feries, ')
          ..write('count_evenements: $count_evenements, ')
          ..write('count_informations: $count_informations, ')
          ..write('count_sondages: $count_sondages, ')
          ..write('count_notifications: $count_notifications')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id_personne,
      count_jours_feries,
      count_evenements,
      count_informations,
      count_sondages,
      count_notifications);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Counter &&
          other.id_personne == this.id_personne &&
          other.count_jours_feries == this.count_jours_feries &&
          other.count_evenements == this.count_evenements &&
          other.count_informations == this.count_informations &&
          other.count_sondages == this.count_sondages &&
          other.count_notifications == this.count_notifications);
}

class CountersCompanion extends UpdateCompanion<Counter> {
  final Value<int> id_personne;
  final Value<int> count_jours_feries;
  final Value<int> count_evenements;
  final Value<int> count_informations;
  final Value<int> count_sondages;
  final Value<int> count_notifications;
  const CountersCompanion({
    this.id_personne = const Value.absent(),
    this.count_jours_feries = const Value.absent(),
    this.count_evenements = const Value.absent(),
    this.count_informations = const Value.absent(),
    this.count_sondages = const Value.absent(),
    this.count_notifications = const Value.absent(),
  });
  CountersCompanion.insert({
    this.id_personne = const Value.absent(),
    required int count_jours_feries,
    required int count_evenements,
    required int count_informations,
    required int count_sondages,
    required int count_notifications,
  })  : count_jours_feries = Value(count_jours_feries),
        count_evenements = Value(count_evenements),
        count_informations = Value(count_informations),
        count_sondages = Value(count_sondages),
        count_notifications = Value(count_notifications);
  static Insertable<Counter> custom({
    Expression<int>? id_personne,
    Expression<int>? count_jours_feries,
    Expression<int>? count_evenements,
    Expression<int>? count_informations,
    Expression<int>? count_sondages,
    Expression<int>? count_notifications,
  }) {
    return RawValuesInsertable({
      if (id_personne != null) 'id_personne': id_personne,
      if (count_jours_feries != null) 'count_jours_feries': count_jours_feries,
      if (count_evenements != null) 'count_evenements': count_evenements,
      if (count_informations != null) 'count_informations': count_informations,
      if (count_sondages != null) 'count_sondages': count_sondages,
      if (count_notifications != null)
        'count_notifications': count_notifications,
    });
  }

  CountersCompanion copyWith(
      {Value<int>? id_personne,
      Value<int>? count_jours_feries,
      Value<int>? count_evenements,
      Value<int>? count_informations,
      Value<int>? count_sondages,
      Value<int>? count_notifications}) {
    return CountersCompanion(
      id_personne: id_personne ?? this.id_personne,
      count_jours_feries: count_jours_feries ?? this.count_jours_feries,
      count_evenements: count_evenements ?? this.count_evenements,
      count_informations: count_informations ?? this.count_informations,
      count_sondages: count_sondages ?? this.count_sondages,
      count_notifications: count_notifications ?? this.count_notifications,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_personne.present) {
      map['id_personne'] = Variable<int>(id_personne.value);
    }
    if (count_jours_feries.present) {
      map['count_jours_feries'] = Variable<int>(count_jours_feries.value);
    }
    if (count_evenements.present) {
      map['count_evenements'] = Variable<int>(count_evenements.value);
    }
    if (count_informations.present) {
      map['count_informations'] = Variable<int>(count_informations.value);
    }
    if (count_sondages.present) {
      map['count_sondages'] = Variable<int>(count_sondages.value);
    }
    if (count_notifications.present) {
      map['count_notifications'] = Variable<int>(count_notifications.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountersCompanion(')
          ..write('id_personne: $id_personne, ')
          ..write('count_jours_feries: $count_jours_feries, ')
          ..write('count_evenements: $count_evenements, ')
          ..write('count_informations: $count_informations, ')
          ..write('count_sondages: $count_sondages, ')
          ..write('count_notifications: $count_notifications')
          ..write(')'))
        .toString();
  }
}

class $CountersTable extends Counters with TableInfo<$CountersTable, Counter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _id_personneMeta =
      const VerificationMeta('id_personne');
  @override
  late final GeneratedColumn<int?> id_personne = GeneratedColumn<int?>(
      'id_personne', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _count_jours_feriesMeta =
      const VerificationMeta('count_jours_feries');
  @override
  late final GeneratedColumn<int?> count_jours_feries = GeneratedColumn<int?>(
      'count_jours_feries', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _count_evenementsMeta =
      const VerificationMeta('count_evenements');
  @override
  late final GeneratedColumn<int?> count_evenements = GeneratedColumn<int?>(
      'count_evenements', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _count_informationsMeta =
      const VerificationMeta('count_informations');
  @override
  late final GeneratedColumn<int?> count_informations = GeneratedColumn<int?>(
      'count_informations', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _count_sondagesMeta =
      const VerificationMeta('count_sondages');
  @override
  late final GeneratedColumn<int?> count_sondages = GeneratedColumn<int?>(
      'count_sondages', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _count_notificationsMeta =
      const VerificationMeta('count_notifications');
  @override
  late final GeneratedColumn<int?> count_notifications = GeneratedColumn<int?>(
      'count_notifications', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id_personne,
        count_jours_feries,
        count_evenements,
        count_informations,
        count_sondages,
        count_notifications
      ];
  @override
  String get aliasedName => _alias ?? 'counters';
  @override
  String get actualTableName => 'counters';
  @override
  VerificationContext validateIntegrity(Insertable<Counter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_personne')) {
      context.handle(
          _id_personneMeta,
          id_personne.isAcceptableOrUnknown(
              data['id_personne']!, _id_personneMeta));
    }
    if (data.containsKey('count_jours_feries')) {
      context.handle(
          _count_jours_feriesMeta,
          count_jours_feries.isAcceptableOrUnknown(
              data['count_jours_feries']!, _count_jours_feriesMeta));
    } else if (isInserting) {
      context.missing(_count_jours_feriesMeta);
    }
    if (data.containsKey('count_evenements')) {
      context.handle(
          _count_evenementsMeta,
          count_evenements.isAcceptableOrUnknown(
              data['count_evenements']!, _count_evenementsMeta));
    } else if (isInserting) {
      context.missing(_count_evenementsMeta);
    }
    if (data.containsKey('count_informations')) {
      context.handle(
          _count_informationsMeta,
          count_informations.isAcceptableOrUnknown(
              data['count_informations']!, _count_informationsMeta));
    } else if (isInserting) {
      context.missing(_count_informationsMeta);
    }
    if (data.containsKey('count_sondages')) {
      context.handle(
          _count_sondagesMeta,
          count_sondages.isAcceptableOrUnknown(
              data['count_sondages']!, _count_sondagesMeta));
    } else if (isInserting) {
      context.missing(_count_sondagesMeta);
    }
    if (data.containsKey('count_notifications')) {
      context.handle(
          _count_notificationsMeta,
          count_notifications.isAcceptableOrUnknown(
              data['count_notifications']!, _count_notificationsMeta));
    } else if (isInserting) {
      context.missing(_count_notificationsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_personne};
  @override
  Counter map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Counter.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CountersTable createAlias(String alias) {
    return $CountersTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PersonnesTable personnes = $PersonnesTable(this);
  late final $RolesTable roles = $RolesTable(this);
  late final $EnfantsTable enfants = $EnfantsTable(this);
  late final $JoursFeriesTable joursFeries = $JoursFeriesTable(this);
  late final $EvenementsTable evenements = $EvenementsTable(this);
  late final $AlbumphotosTable albumphotos = $AlbumphotosTable(this);
  late final $PiecesjointesTable piecesjointes = $PiecesjointesTable(this);
  late final $InformationsTable informations = $InformationsTable(this);
  late final $AgendaTypesTable agendaTypes = $AgendaTypesTable(this);
  late final $AgendaTypesDetailsTable agendaTypesDetails =
      $AgendaTypesDetailsTable(this);
  late final $AgendaTypesPrestationsTable agendaTypesPrestations =
      $AgendaTypesPrestationsTable(this);
  late final $AgendasTable agendas = $AgendasTable(this);
  late final $PersonneEnseignantsTable personneEnseignants =
      $PersonneEnseignantsTable(this);
  late final $AgendaPhotoDetailsTable agendaPhotoDetails =
      $AgendaPhotoDetailsTable(this);
  late final $AgendaNotesTable agendaNotes = $AgendaNotesTable(this);
  late final $PersonneNotesTable personneNotes = $PersonneNotesTable(this);
  late final $AgendaDetailsTable agendaDetails = $AgendaDetailsTable(this);
  late final $AddNotesTable addNotes = $AddNotesTable(this);
  late final $AgendaDatesTable agendaDates = $AgendaDatesTable(this);
  late final $EleveAttestationScolairesTable eleveAttestationScolaires =
      $EleveAttestationScolairesTable(this);
  late final $DemandesAttestationsTable demandesAttestations =
      $DemandesAttestationsTable(this);
  late final $RemoveDemandesAttestationsTable removeDemandesAttestations =
      $RemoveDemandesAttestationsTable(this);
  late final $EmploitempsTable emploitemps = $EmploitempsTable(this);
  late final $SeancesTable seances = $SeancesTable(this);
  late final $EnseignantsTable enseignants = $EnseignantsTable(this);
  late final $ReservationsCantineDatesTable reservationsCantineDates =
      $ReservationsCantineDatesTable(this);
  late final $ReservationsCantinesTable reservationsCantines =
      $ReservationsCantinesTable(this);
  late final $PlanCantinesTable planCantines = $PlanCantinesTable(this);
  late final $PlatsTable plats = $PlatsTable(this);
  late final $DevoirsTable devoirs = $DevoirsTable(this);
  late final $DevoirPiecesjointesTable devoirPiecesjointes =
      $DevoirPiecesjointesTable(this);
  late final $ParentNotificationsTable parentNotifications =
      $ParentNotificationsTable(this);
  late final $CountJoursFeriesTable countJoursFeries =
      $CountJoursFeriesTable(this);
  late final $CountNotificationsTable countNotifications =
      $CountNotificationsTable(this);
  late final $CountInformationsTable countInformations =
      $CountInformationsTable(this);
  late final $CountEvenementsTable countEvenements =
      $CountEvenementsTable(this);
  late final $RecuperationsTable recuperations = $RecuperationsTable(this);
  late final $CountSondagesTable countSondages = $CountSondagesTable(this);
  late final $CountersTable counters = $CountersTable(this);
  late final PersonnesDao personnesDao = PersonnesDao(this as AppDatabase);
  late final RolesDao rolesDao = RolesDao(this as AppDatabase);
  late final EnfantsDao enfantsDao = EnfantsDao(this as AppDatabase);
  late final JoursFeriesDao joursFeriesDao =
      JoursFeriesDao(this as AppDatabase);
  late final EvenementsDao evenementsDao = EvenementsDao(this as AppDatabase);
  late final AlbumphotosDao albumphotosDao =
      AlbumphotosDao(this as AppDatabase);
  late final PiecesjointesDao piecesjointesDao =
      PiecesjointesDao(this as AppDatabase);
  late final InformationsDao informationsDao =
      InformationsDao(this as AppDatabase);
  late final AgendaTypesDao agendaTypesDao =
      AgendaTypesDao(this as AppDatabase);
  late final AgendaTypesDetailsDao agendaTypesDetailsDao =
      AgendaTypesDetailsDao(this as AppDatabase);
  late final AgendaTypesPrestationsDao agendaTypesPrestationsDao =
      AgendaTypesPrestationsDao(this as AppDatabase);
  late final AgendasDao agendasDao = AgendasDao(this as AppDatabase);
  late final PersonneEnseignantsDao personneEnseignantsDao =
      PersonneEnseignantsDao(this as AppDatabase);
  late final AgendaPhotoDetailsDao agendaPhotoDetailsDao =
      AgendaPhotoDetailsDao(this as AppDatabase);
  late final AgendaNotesDao agendaNotesDao =
      AgendaNotesDao(this as AppDatabase);
  late final PersonneNotesDao personneNotesDao =
      PersonneNotesDao(this as AppDatabase);
  late final AgendaDetailsDao agendaDetailsDao =
      AgendaDetailsDao(this as AppDatabase);
  late final AddNotesDao addNotesDao = AddNotesDao(this as AppDatabase);
  late final AgendaDatesDao agendaDatesDao =
      AgendaDatesDao(this as AppDatabase);
  late final EleveAttestationScolairesDao eleveAttestationScolairesDao =
      EleveAttestationScolairesDao(this as AppDatabase);
  late final DemandesAttestationsDao demandesAttestationsDao =
      DemandesAttestationsDao(this as AppDatabase);
  late final RemoveDemandesAttestationsDao removeDemandesAttestationsDao =
      RemoveDemandesAttestationsDao(this as AppDatabase);
  late final EmploitempsDao emploitempsDao =
      EmploitempsDao(this as AppDatabase);
  late final SeancesDao seancesDao = SeancesDao(this as AppDatabase);
  late final EnseignantsDao enseignantsDao =
      EnseignantsDao(this as AppDatabase);
  late final ReservationsCantineDatesDao reservationsCantineDatesDao =
      ReservationsCantineDatesDao(this as AppDatabase);
  late final ReservationsCantinesDao reservationsCantinesDao =
      ReservationsCantinesDao(this as AppDatabase);
  late final PlanCantinesDao planCantinesDao =
      PlanCantinesDao(this as AppDatabase);
  late final PlatsDao platsDao = PlatsDao(this as AppDatabase);
  late final DevoirsDao devoirsDao = DevoirsDao(this as AppDatabase);
  late final DevoirPiecesjointesDao devoirPiecesjointesDao =
      DevoirPiecesjointesDao(this as AppDatabase);
  late final ParentNotificationsDao parentNotificationsDao =
      ParentNotificationsDao(this as AppDatabase);
  late final CountJoursFeriesDao countJoursFeriesDao =
      CountJoursFeriesDao(this as AppDatabase);
  late final CountNotificationsDao countNotificationsDao =
      CountNotificationsDao(this as AppDatabase);
  late final CountInformationsDao countInformationsDao =
      CountInformationsDao(this as AppDatabase);
  late final CountEvenementsDao countEvenementsDao =
      CountEvenementsDao(this as AppDatabase);
  late final RecuperationsDao recuperationsDao =
      RecuperationsDao(this as AppDatabase);
  late final CountSondagesDao countSondagesDao =
      CountSondagesDao(this as AppDatabase);
  late final CountersDao countersDao = CountersDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        personnes,
        roles,
        enfants,
        joursFeries,
        evenements,
        albumphotos,
        piecesjointes,
        informations,
        agendaTypes,
        agendaTypesDetails,
        agendaTypesPrestations,
        agendas,
        personneEnseignants,
        agendaPhotoDetails,
        agendaNotes,
        personneNotes,
        agendaDetails,
        addNotes,
        agendaDates,
        eleveAttestationScolaires,
        demandesAttestations,
        removeDemandesAttestations,
        emploitemps,
        seances,
        enseignants,
        reservationsCantineDates,
        reservationsCantines,
        planCantines,
        plats,
        devoirs,
        devoirPiecesjointes,
        parentNotifications,
        countJoursFeries,
        countNotifications,
        countInformations,
        countEvenements,
        recuperations,
        countSondages,
        counters
      ];
}
