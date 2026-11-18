import 'package:flutter/material.dart';
import '../../app/theme/app_theme.dart';
import '../../core/routes/app_routes.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.register});
  final bool register;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 470),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(alignment: Alignment.centerLeft, child: IconButton(onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back))),
                        const Icon(Icons.toys_rounded, size: 52, color: AppTheme.primary),
                        const SizedBox(height: 14),
                        Text(widget.register ? 'Crea tu perfil' : '¡Qué bueno verte!', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(height: 8),
                        Text(widget.register ? 'Elige un apodo para comenzar.' : 'Ingresa con tu apodo y contraseña.', textAlign: TextAlign.center),
                        const SizedBox(height: 24),
                        if (widget.register) ...[
                          const Text('Tu apodo'), const SizedBox(height: 8),
                          TextFormField(decoration: const InputDecoration(hintText: 'Ej. ExploradorAzul', prefixIcon: Icon(Icons.face)), validator: (v) => v == null || v.trim().length < 3 ? 'Escribe al menos 3 caracteres' : null),
                          const SizedBox(height: 16), const Text('Elige tu avatar'), const SizedBox(height: 8),
                          Wrap(spacing: 8, children: ['🚀', '🦊', '🐼', '🦉', '🐢'].map((e) => ChoiceChip(label: Text(e, style: const TextStyle(fontSize: 22)), selected: e == '🚀', onSelected: (_) {}, showCheckmark: false)).toList()),
                          const SizedBox(height: 16),
                        ] else ...[
                          const Text('Apodo'), const SizedBox(height: 8),
                          TextFormField(decoration: const InputDecoration(hintText: 'Tu apodo', prefixIcon: Icon(Icons.person_outline)), validator: (v) => v == null || v.isEmpty ? 'Escribe tu apodo' : null),
                          const SizedBox(height: 16),
                        ],
                        const Text('Contraseña'), const SizedBox(height: 8),
                        TextFormField(obscureText: _obscure, decoration: InputDecoration(hintText: 'Mínimo 4 caracteres', prefixIcon: const Icon(Icons.lock_outline), suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined), onPressed: () => setState(() => _obscure = !_obscure))), validator: (v) => v == null || v.length < 4 ? 'Usa al menos 4 caracteres' : null),
                        const SizedBox(height: 24),
                        FilledButton(onPressed: () { if (_form.currentState!.validate()) Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboard, (_) => false); }, child: Text(widget.register ? 'Crear perfil' : 'Iniciar sesión')),
                        TextButton(onPressed: () => Navigator.pushReplacementNamed(context, widget.register ? AppRoutes.login : AppRoutes.register), child: Text(widget.register ? 'Ya tengo una cuenta' : 'Crear perfil nuevo')),
                        const Text('Maqueta demostrativa: las cuentas no se guardan.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Color(0xFF8995A8))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
