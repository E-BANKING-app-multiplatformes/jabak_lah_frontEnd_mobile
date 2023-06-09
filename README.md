# e_banking_app

Projet Jabak_Lah

## Getting Started

This project is a starting point for a Flutter mobile application avec backend Spring boot.

# pour executer projet flutter voici les étapes:


   # dans la partie jabak_lah_backend:
    -changer le port de serveur et l'adress ip dans le fichier de configuration suivant 
        /.../jabak_lah_backend\src\main\resources\application.yaml 
    -elver les commentaires dans le fichier :../jabak_lah_backend\src\main\java\com\eBankingApp\jabak_lah_backend
        de la ligne 28 à la ligne 39 pour la creation du base de la base de donnée
    -apres la creation d'un client on passe la la partie front;
   # dans la partie mobile E_Banking_App:
    - inserer le même port precisée dans la partie backend avec la commande suivante:
       "set FLUTTER_BUILD_APP_PORT=8889"
    - executer lo projet avec la commande : flutter run 
