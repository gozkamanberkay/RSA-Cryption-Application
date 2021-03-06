/// ---------------------------------------------------
class Primes {
  int p;
  int q;

  Primes(this.p, this.q);
}

/// ---------------------------------------------------
class PublicKey {
  int n;
  int e;

  PublicKey(this.n, this.e);
}

/// ---------------------------------------------------
class PrivateKey {
  int n;
  int d;

  PrivateKey(this.n, this.d);
}

/// ---------------------------------------------------
class RSA {
  Primes _primes;
  PublicKey _publicKey;
  PrivateKey _privateKey;
  int _phi;
  List<int> _list;

  RSA(int p, int q) {
    _primes = Primes(p, q);

    _phi = (_primes.p - 1) * (_primes.q - 1);

    _generatePublicKey();
    _generatePrivateKey();
  } // constructor RSA

  String getStringValueOfPublicKey() {
    String temp = '{ n, e } : { ${_publicKey.n}, ${_publicKey.e} }';

    return temp;
  } // method getStringValueOfPublicKey

  String getStringValueOfPrivateKey() {
    String temp = '{ n, d } : { ${_publicKey.n}, ${_privateKey.d} }';

    return temp;
  } // method getStringValueOfPrivateKey

  int _calculateGcd(int a, int b) {
    int gcd;

    while (true) {
      gcd = a % b;
      if (gcd == 0) {
        return b;
      }

      a = b;
      b = gcd;
    }
  } // method _calculateGcd

  int _exponent() {
    int e = 2;

    while (e < _phi) {
      if (_calculateGcd(e, _phi) == 1) {
        break;
      } else {
        e = e + 1;
      }
    }

    return e;
  } // method _exponent

  void _generatePublicKey() {
    int n = _primes.p * _primes.q;
    int e = _exponent();

    _publicKey = PublicKey(n, e);
  } // method _generatePublicKey

  void _generatePrivateKey() {
    int n = _primes.p * _primes.q;
    int d = _publicKey.e.modInverse(_phi); // d = e ^ (-1) mod phi

    _privateKey = PrivateKey(n, d);
  } // method _generatePrivateKey

  String getStringValueOfAscii(String plaintext) {
    String asciiText = '';

    _list = [...plaintext.codeUnits];

    _list.forEach(
      (element) {
        asciiText = asciiText + element.toString();
      },
    );

    return asciiText;
  } // method getStringValueOfAscii

  String encrypt(String plaintext) {
    String encryptedText = '';

    // Convert characters to ASCII decimals,
    // Copy from unmodifiable list to the modifiable list.
    _list = [...plaintext.codeUnits];

    for (int i = 0; i < _list.length; i++) {
      _list[i] = _list[i].modPow(_publicKey.e, _publicKey.n);
    }

    _list.forEach(
      (element) {
        encryptedText = encryptedText + element.toString() + ' ';
      },
    );

    return encryptedText;
  } // method encrypt

  String decrypt(String plainText) {
    String decryptedText = '';

    for (int i = 0; i < _list.length; i++) {
      _list[i] = _list[i].modPow(_privateKey.d, _privateKey.n);
    }

    _list.forEach(
      (element) {
        decryptedText = decryptedText + element.toString() + ' ';
      },
    );

    return decryptedText;
  } // method decrypt
} // class RSA
