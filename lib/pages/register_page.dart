import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ÜST GÖRSEL
              ClipPath(
                clipper: HalfCircleClipper(),
                child: Container(
                  height: size.height * 0.3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/forest.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Kayıt Ol',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: size.width * 0.08,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // FORM ALANI
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
             
                    const SizedBox(height: 16),

                    // Email
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Şifre
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Şifre',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Şifre Tekrar
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Şifre (Tekrar)',
                        prefixIcon: const Icon(Icons.lock_reset_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Kayıt Ol Butonu
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Firebase ile kayıt işlemi yapılacak
                      },
                      child: const Text(
                        'Kayıt Ol',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Giriş Sayfasına Dön
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Zaten hesabın var mı? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // login'e geri dön
                          },
                          child: const Text(
                            "Giriş yap.",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Aynı yarım daire klip kullanılabilir
class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
