import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // E-posta/şifre ile kayıt ol
  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Başarılı ise hata yok
    } on FirebaseAuthException catch (e) {
      return getErrorMessage(e.code);
    } catch (e) {
      return 'Bilinmeyen bir hata oluştu.';
    }
  }

  // E-posta/şifre ile giriş yap
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Başarılı ise hata yok
    } on FirebaseAuthException catch (e) {
      return getErrorMessage(e.code);
    } catch (e) {
      return 'Bilinmeyen bir hata oluştu.';
    }
  }

  // Firebase hata kodunu Türkçe mesaja çevir
  String getErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Geçersiz e-posta adresi.';
      case 'user-disabled':
        return 'Bu kullanıcı devre dışı bırakılmış.';
      case 'user-not-found':
        return 'Kullanıcı bulunamadı.';
      case 'wrong-password':
        return 'Hatalı şifre girdiniz.';
      case 'email-already-in-use':
        return 'Bu e-posta adresi zaten kullanılıyor.';
      case 'weak-password':
        return 'Şifreniz çok zayıf.';
      case 'operation-not-allowed':
        return 'Bu işlem şu anda aktif değil.';
      default:
        return 'Bir hata oluştu. Lütfen tekrar deneyin.';
    }
  }
}
