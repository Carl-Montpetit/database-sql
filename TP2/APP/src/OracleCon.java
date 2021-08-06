/*
Nom : Carl Montpetit
Code permanent : MONC08069000

Nom : Matthew Jovani
Code permanent : JOVM19108705

Nom : Mathieu Dumont
Code permanent : DUMM21059400
*/
/*--------------------------------------------------------------------------------------------------------------------*/
// L'APPLICATION JAVA //
/*--------------------------------------------------------------------------------------------------------------------*/
/*
    Id #10 --> Priorité : Très important

    Développer une application affichant la liste des employés et des visiteurs qui étaient à l’usine entre deux dates
    et qui ont visité un département spécifique.
*/
// Importation la totalité de la bibliothèque de java.sql
package net.codejava;

import oracle.sql.DATE;

import java.sql.*;

class OracleCon {
    public static void main( String args[] ) throws ClassNotFoundException {
        // Java version 16 est utilisé et FONCTIONNE ⬇︎
        //************************************************************************************************************//
        // ✦Constantes utiles✦
        //************************************************************************************************************//
        // Informations
        final String nomUtilisateur = "userName"; // FIXME ➬ mettre son nom utilisateur Oracle ☞ Uqam︎ ️️︎⚠️
        final String motDePasse = "ABC123"; // FIXME ➬ mettre son mot de passe Oracle ☞ Uqam︎ ️️︎⚠️
        final String nomServeur = "zeta2.labunix.uqam.ca";
        final String URLbaseDeDonnees = "jdbc:oracle:thin:@zeta2.labunix.uqam.ca:1521:baclab";
        // Séparateur entre les affichages et les messages
        final String line = "====================================================";
        // Messages
        final String succesConnection = "✔︎ Connecté à la base de données !..🔐";
        final String fermeture = "✔︎ Fin de la requête, fermeture de la connection!..🔒";
        final String erreurConnection = "✗ Échec, la connection à la base de données a échouée!..⚠️";

        //************************************************************************************************************//
        // étape #1 : chargement des driver de la classe
        //************************************************************************************************************//
        /* Il faut préalablement télécharger le driver Oracle ojdbc11 à l'adresse :
        https://www.oracle.com/ca-en/database/technologies/appdev/jdbc-downloads.html

        Et ensuite ajouter les dépendances : (je l'ai fais dans intelliJ Ultimate)
        1) Aller dans project structure
        2) modules ⟹ dependencies ⟹ + (symbole) ⟹ JARS ⟹ choisir l'emplacement local de ojdbc11.jar
        3) ⟹ apply ⟹ OK
         */
        //************************************************************************************************************//
        // étape #2 : création d'un object de connection avec le serveur zeta2 de l'UQAM
        //************************************************************************************************************//
        try ( Connection connection = DriverManager.getConnection( URLbaseDeDonnees, nomUtilisateur, motDePasse ) ) {
            if ( connection != null ) {
                System.out.println( line );
                System.out.println( succesConnection );
                System.out.println( line );
            } else {
                System.out.println( erreurConnection );
            }

            //********************************************************************************************************//
            // étape #3 : création de l'object de statement
            //********************************************************************************************************//
            Statement statement = connection.createStatement( );

            //********************************************************************************************************//
            // étape #4 : execution de la requête SQL
            //********************************************************************************************************//
            // La requête SQL pour le TP2
            CallableStatement fonctionPresenceDepartement = connection.prepareCall( "DECLARE\n" +
                    "v_resultat varchar2(500);\n" +
                    "BEGIN\n" +
                    "v_resultat := f_presence_departement('2021-05-01','2021-07-25','Production');\n" +
                    "END;" );
            // On applique des valeurs aux paramètres de la procedure
            fonctionPresenceDepartement.setDate( 1, Date.valueOf( "2021-05-01" ) );
            fonctionPresenceDepartement.setDate( 2, Date.valueOf( "2021-07-25" ) );
            fonctionPresenceDepartement.setString( 3, "Production" );
            // On enregistre les paramètres
            fonctionPresenceDepartement.registerOutParameter( 1, Types.DATE );
            fonctionPresenceDepartement.registerOutParameter( 2, Types.DATE );
            fonctionPresenceDepartement.registerOutParameter( 3, Types.VARCHAR );
            // On exécute la procédure avec les paramètres ⟹ affiche rien à la console, mais fonctionne
            fonctionPresenceDepartement.execute( );

            //********************************************************************************************************//
            // ⚠️NOTES⚠️
            //********************************************************************************************************//
            // Je n'ai seulement pas réussie à imprimer le contenu de la variable v_resultat qui contient le retour
            // de la fonction du PL/SQL si haut ⇧ : (dans SQL developer)
            //Il n'existe aucune présence entre ces deux dates pour cet enregistrement!..
            //Il n'existe aucune présence entre ces deux dates pour cet enregistrement!..
            //Il n'existe aucune présence entre ces deux dates pour cet enregistrement!..
            //Il n'existe aucune présence entre ces deux dates pour cet enregistrement!..
            //Il n'existe aucune présence entre ces deux dates pour cet enregistrement!..
            //Présence de ⟺Carla ⟺ du départementProduction ⟺ pour le 21-06-23 06:00:00.000000

            //********************************************************************************************************//
            // Des essaies et des tests variés pour tester l'application
            //********************************************************************************************************//
            // On exctrait les paramètres dans des variables
//            Date param1 = procedurePresenceDepartement.getDate(1);
//            Date param2 = procedurePresenceDepartement.getDate(2);
//            String param3 = procedurePresenceDepartement.getString(3);
            // On affiche les paramètres à la console
//            System.out.println("param1 : " + param1);
//            System.out.println("param2 : " + param2);
//            System.out.println("param3 : " + param3);

            // Un test sur la table "dummy" de Oracle pour sortir la date du système
//            ResultSet resultSet = statement.executeQuery( "SELECT SYSDATE FROM DUAL" );
//            if ( resultSet.next( ) ) {
//                Date dateCourante = resultSet.getDate( 1 ); // get la première colonne
//                System.out.println( "La date courante est : " + dateCourante );

            // Un test pour afficher le contenu d'une table
//            ResultSet resultSet = statement.executeQuery( "SELECT * FROM employe" +
//                    "END;" );
//            while ( resultSet.next( ) )
//                System.out.println( resultSet.getInt( 1 ) +
//                        "\t\t" + resultSet.getString( 2 ) +
//                        "\t\t" + resultSet.getString( 3 ) +
//                        "\t\t" + resultSet.getString( 4 ) +
//                        "\t\t" + resultSet.getString( 5 ));
//            }

            //********************************************************************************************************//
            // étape #5 : fermer la connection à l'object
            //********************************************************************************************************//
            connection.close( );
//            resultSet.close( );
            fonctionPresenceDepartement.close( );
//            statement.close( );
            System.out.println( line );
            System.out.println( fermeture );
            System.out.println( line );

            //********************************************************************************************************//
            // Attraper les exception s'il y en a
            //********************************************************************************************************//
        } catch ( SQLException e ) {
            System.err.format( "SQL State: %s\n%s", e.getSQLState( ), e.getMessage( ) );
        } catch ( Exception e ) {
            e.printStackTrace( );
        }

        //************************************************************************************************************//
        // ☆FIN DE L'APPLICATION JAVA☆
        //************************************************************************************************************//
    }
}