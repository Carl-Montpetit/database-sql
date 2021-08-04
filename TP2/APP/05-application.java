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

import java.sql.*;

class OracleCon {
    public static void main( String args[] ) {
        try {
// étape #1 : chargement des driver de la classe
            Class.forName( "oracle.jdbc.driver.OracleDriver" );
            // ou
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

// étape #2 : création d'un object de connection avec le serveur zeta2 de l'UQAM
            Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle" );

// étape #3 : création de l'object de statement
            Statement stmt = con.createStatement( );

// étape #4 : execution de la requête SQL
            // Un test sur une de nos table
            ResultSet rs = stmt.executeQuery( "select * from personne" );
            while ( rs.next( ) )
                System.out.println( rs.getInt( 1 ) + "  " + rs.getString( 2 ) + "  " + rs.getString( 3 ) );
            // Un test sur la table "dummy" de Oracle pour sortir la date du système
            ResultSet rs = statement.executeQuery("SELECT SYSDATE FROM DUAL");
            if (rs.next()) {
                Date currentDate = rs.getDate(1); // get first column returned
                System.out.println("Current Date from Oracle is : "+currentDate);
            }
// étape #5 : fermer la connection à l'object
            con.close( );
            rs.close();
            statement.close();
        } catch ( Exception e ) {
            System.out.println( e );
        }
    }
}  