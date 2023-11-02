import 'package:chat_app/presentation/screens/Home.dart';
import 'package:chat_app/presentation/screens/Login.dart';
import 'package:chat_app/presentation/screens/Register.dart';
import 'package:chat_app/presentation/socket/chat_socket.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChatSocket();
      }),
  GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return Register();
      }),
  // GoRoute(
  //     path: '/login',
  //     builder: (BuildContext context, GoRouterState state) {
  //       return LoginScreen();
  //     }),
  // //para pasarlo un parametro
  // GoRoute(
  //     path: '/blog/:id',
  //     name: 'blog',
  //     builder: (context, state) => Blog(id: state.pathParameters['id']))
]);
