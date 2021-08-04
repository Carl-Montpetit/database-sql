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

    Développer une application affichant la liste des employés et des visiteurs qui étaient à l’usine entre deux dates et qui ont visité un département spécifique.
*/
// Importation la totalité de la bibliothèque de java.sql

import java.sql.*;

class OracleCon {
    public static void main( String args[] ) throws ClassNotFoundException {
// étape #1 : chargement des driver de la classe
        // FIXME ça ne fonctionne pas pour ça encore supposément qu'il faut télécharger quelque chose et ensuite le
        //  pointer sur ce truc ici ☟ après ça devrait se connecter et fonctionner!
        Class.forName( "oracle.jdbc.driver.OracleDriver" );
        // ou ?? ⟿ ne trouve pas la classe OracleDriver ou de quoi du genre…
//            DriverManager.registerDriver( new oracle.jdbc.driver.OracleDriver( ) );

// étape #2 : création d'un object de connection avec le serveur zeta2 de l'UQAM
        // password ⟹ votre mot de passe oracle.txt ☕️
        try ( Connection connection = DriverManager.getConnection(
                "jdbc:oracle:thin:@zeta2.labunix.uqam.ca:1521:baclab", "system", "" ) ) {
            if ( connection != null ) {
                System.out.println( "✔︎ Connecté à la base de données!" );
            } else {
                System.out.println( "✗ Échec, la connection à la base de données a échouée!.." );
            }

            // étape #3 : création de l'object de statement
            Statement statement = connection.createStatement( );

            // étape #4 : execution de la requête SQL
            // Un test sur une de nos table
//            ResultSet rs = stmt.executeQuery( "select * from personne" );
//            while ( rs.next( ) )
//                System.out.println( rs.getInt( 1 ) + "  " + rs.getString( 2 ) + "  " + rs.getString( 3 ) );

            // Un test sur la table "dummy" de Oracle pour sortir la date du système
            ResultSet resultSet = statement.executeQuery( "SELECT SYSDATE FROM DUAL" );
            if ( resultSet.next( ) ) {
                Date currentDate = resultSet.getDate( 1 ); // get first column returned
                System.out.println( "La base de données courrante d'Oracle est : " + currentDate );
            }

// étape #5 : fermer la connection à l'object
            connection.close( );
            resultSet.close( );
            statement.close( );
        } catch ( SQLException e ) {
            System.err.format( "SQL State: %s\n%s", e.getSQLState( ), e.getMessage( ) );
        } catch ( Exception e ) {
            e.printStackTrace( );
        }
    }
}