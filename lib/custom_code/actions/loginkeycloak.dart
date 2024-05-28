import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
import 'dart:html';

import 'package:keycloak_flutter/keycloak_flutter.dart';

Future<void> startKeyCloak(KeycloakService keycloakService) async {
  keycloakService = KeycloakService(KeycloakConfig(
    url: 'https://rhsso-dev.grupomateus.com.br/auth',
    realm: 'grupomateus',
    clientId: 'gmsuite',
  ));

  print('Instanciando o Keycloak');

  await keycloakService.init(
    initOptions: KeycloakInitOptions(
      onLoad: 'check-sso',
      responseMode: 'query',
      redirectUri: '${window.location.origin}',
    ),
  );
}

Future<KeycloakProfile?> loginKeyCloak(KeycloakService keycloakService) async {
  if (keycloakService.authenticated) {
    print('Usuário autenticado');
    return await keycloakService.loadUserProfile(false);
  } else {
    print('Não autenticado, chamando keycloak');
    keycloakService.login();
    return null;
  }
}
