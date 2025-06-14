variable "token_secret" {
}

variable "token_id" {
}

variable "api_url" {
}

variable "ansible_ssh_user" {
}

variable "ansible_ssh_private_key_file" {
}

variable "ansible_sudo_pass" {
}

variable "docker_stack_name" {
}

variable "docker_image" {
}

variable "state" {
}

variable "sources" {
}

variable "hostname" {
}

variable "auth_key" {
}

variable "private_key" {
  type      = string
  sensitive = true
  default   = <<EOF
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1Lt6gQj59/GQS
6qEcXRcPz8oPFnTr3k7J5UlgjVot2jReUL7yZLjmbHJipgtANixHtL06lfMSvRn7
zhh3HsWv8WCbjG3aVLDj1fsoV49EMOKgCgAB/bWZeZmXr6qw8aleQopDCaBJ1SAp
TQ+/r9nFSkLWiTlwzwf2PJB4iy1uY3UChHYyRqn+s/3jCM5O0nnXlJSL8AWkDdf4
NDzu4N3tcs63sFMWS4olW8oaze42bdgF1kol1/mJb2ys78eY6fk+o2y0WvIH1x2v
qfcgvG6m7qCLCDh/ZTRBxqhNEVPJ8ijTr/V8I56UqJQI6fpScBEXYfPf0IftvvV9
aWa5MEs/AgMBAAECggEBAKGdhFJZpNrGtxG0ny/ozbh59lhNBNCdBZTMZQ6uJ+G8
wXfb+OfI9rH7zHC4glKtwAPacez/csqlSbc2WNZw6ZAO9Mjrk9XsM7mX1yheKlp+
bLirEuSzxjh3oo0O0mhxuE1vd1tjC8qwRLbymXi4SL3WhxZNY6J/2i9ISOpt44GR
z8U3UYRXthurebZrF9okUttcKfp3Cowff4oeiG76ObAqma/JR3w0aVeJn68snn8f
8+jLvmZll9vKru8CHdTi6mbtQejq5CYJBufITwa0uwPErtkTey/zxrrJ5BIFB9xF
RI0t9Ewlky7EJCWZT2QC5atgw7uAd/V7uZXEYEGZ7oECgYEA2IdCL6bHUhHbim2f
AyTpO2/LNwBy543i6KYTJsbWnG4Y4sqllC1d6Un4L+TFmH469bRgS26MeN/oFbq0
4+w36qgbxBm9/eLaW20hoIBPrcK89A5tryAMvcr/AHg+KReK5UYoSIO9om08mK1A
T4BIsmQEeL6SChYFp2AjXT0wkX8CgYEA1jYmvZ+4I47Kzu43jPLCbVaIXmeh3OFp
e8mnMfmOmEgQOckKjmZpshfvZ8cFJNYaF/a3y4gyhLuupMKtQFCzIOyU2ona4hbx
Uz2nPQjwOaTXpi6MaIpHXjSZg2N4b5sNoemcvdn34zw2aGrQBRGz28JD9XkY9LpL
BUhi6Jn9pkECgYA0VlVQMU7iboCTcDXMS8K4ZChJjik4ARrEw0fDyrIbM51+TB9D
tseJWSDNas28M17K/yN7eCgqG2z8u5l3siQ96w5zEwnScV/4U2OaaQlZZcXIdChc
+TE7OvLySR41ToR7ML8R8A4JUcAg41e1H7vyqqxOBzpDh9ksANfrdJvlvwKBgBAG
lxlipJ0MZsHaco957e/OJH+jkyl6N7EKIhcMC436/jPEhaSnpsqrHb8O1aSu297l
F1UDyHvDqsoqwllocC5LZMuAur5lZwKKP0PCsm4tlfCZ1OlRRwuWNdHtlCoNWJS/
bHmLoA8BBzUCoLNwYptTSlBIEgTlFw27H6M1OhPBAoGAbUxScX66J6YsKUz19FLC
OPnt4JIC1l33lG3l4l0tiI9jp43xLIFKC/d2YAtmEE4MqskLRcLC72/NeAlF5TU+
UG5y54wVo/UfQLNlF5+5OG8GHpBCaScWM2IfwLC0Ln/usO9iRSEjGEl5vbRsC5YK
TMZF2kOVPRQBhq47RlEfU/s=
-----END PRIVATE KEY-----
  EOF
}