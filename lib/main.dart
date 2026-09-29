import 'package:flutter/material.dart';

// --- Cores e Estilos da Marca ---
class NutriFitColors {
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color backgroundLight = Color(0xFFE8F5E9);
  static const Color surface = Colors.white;
}

void main() {
  runApp(const NutriFitApp());
}

class NutriFitApp extends StatelessWidget {
  const NutriFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: NutriFitColors.primary,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}

// --- Tela de Apresentação e Início (Welcome Screen) ---
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              NutriFitColors.backgroundLight,
              NutriFitColors.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo da Marca
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: NutriFitColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: NutriFitColors.primary.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.eco_rounded,
                    size: 48,
                    color: NutriFitColors.surface,
                  ),
                ),
                const SizedBox(height: 16),
                // Nome da Marca
                Text(
                  'NutriFit',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: NutriFitColors.primaryDark,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                // Imagem de Comida / Refeição Saudável
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=800&q=80',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: NutriFitColors.backgroundLight,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: NutriFitColors.primary,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: NutriFitColors.backgroundLight,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.restaurant_rounded,
                              size: 48,
                              color: NutriFitColors.primary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Frase Motivacional
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: NutriFitColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: NutriFitColors.primary.withValues(alpha: 0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.format_quote_rounded,
                        color: NutriFitColors.primary,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '"Sua melhor versão começa com escolhas saudáveis e consistência."',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: NutriFitColors.primaryDark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Serviços do NutriFit (Título)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nossos Serviços',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: NutriFitColors.primaryDark,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Lista de Serviços
                const ServiceCard(
                  icon: Icons.restaurant_menu_rounded,
                  title: 'Planos Nutricionais Personalizados',
                  description: 'Cardápios sob medida para seus objetivos e rotina.',
                ),
                const SizedBox(height: 10),
                const ServiceCard(
                  icon: Icons.fitness_center_rounded,
                  title: 'Treinos Inteligentes',
                  description: 'Exercícios guiados para casa ou academia.',
                ),
                const SizedBox(height: 10),
                const ServiceCard(
                  icon: Icons.water_drop_rounded,
                  title: 'Monitoramento de Hidratação',
                  description: 'Controle diário de água para manter seu corpo ativo.',
                ),
                const SizedBox(height: 10),
                const ServiceCard(
                  icon: Icons.insights_rounded,
                  title: 'Acompanhamento de Progresso',
                  description: 'Gráficos de evolução de peso, medidas e desempenho.',
                ),
                const SizedBox(height: 32),
                // Botão de Início
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Iniciando sua jornada no NutriFit!'),
                          backgroundColor: NutriFitColors.primary,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NutriFitColors.primary,
                      foregroundColor: NutriFitColors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Iniciar Minha Jornada',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Widget para os Cards de Serviços ---
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NutriFitColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: NutriFitColors.backgroundLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: NutriFitColors.primary,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: NutriFitColors.primaryDark,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
