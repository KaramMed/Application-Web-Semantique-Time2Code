package OWL;

import java.util.ArrayList;

import org.apache.jena.iri.impl.Main;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.DatasetFactory;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.rdf.model.RDFWriter;
import org.apache.jena.rdfconnection.RDFConnection;
import org.apache.jena.rdfconnection.RDFConnectionFactory;
import org.apache.jena.sparql.core.DatasetGraph;
import org.apache.jena.sparql.core.DatasetImpl;
import org.apache.jena.update.UpdateAction;
import org.apache.jena.update.UpdateFactory;
import org.apache.jena.update.UpdateRequest;
import org.apache.jena.*;
import org.apache.jena.util.FileManager;

// j'ai crée cette classe qui contient les methodes pour utiliser des requetes SPARQL
public class OWLUtil {

// cette methode renvoie une liste d'enregistrements d'une variable apres lui
// donner une requete sparql select + la variable a afficher
public static ArrayList<String> getVariable(String requete,String variable){
	try {
	// on doit transformer le fichier RDF en model
		FileManager.get().addLocatorClassLoader(Main.class.getClassLoader());
		// on importe avec le chemin d'ontologie
		Model model = FileManager.get().loadModel("OWL/organisation.owl");
		// on va exprimer l'ontologie avec TURTLE pour l'afficher
		// N-Triples : affiche sous forme de triplets
		// RDF/XML , RDF/JSON , TriG , N-Quads
		//model.write(System.out,"Turtle");
		// Requetes SPARQL
		org.apache.jena.query.Query query = QueryFactory.create(requete);
		QueryExecution qexec = QueryExecutionFactory.create(requete,model);
		ResultSet resultat = qexec.execSelect(); // on a choisit execSelect pour SELECT
		// la liste qui sera renvoyé
		ArrayList<String> reps = new ArrayList<String>();
		while(resultat.hasNext()) {
			QuerySolution sol = resultat.nextSolution();
			// affiche la colonne souhaité ( variable )
			RDFNode r = sol.get(variable);	
			// pour afficher que le nom de la ressource sans tout le uri 
		if(r.toString().contains("#")) {
			 String[] vv = r.toString().split("#");
			 String vs = vv[1];
			 // en cas d'integer
			 if(vs.equals("integer") || vs.equals("string")) {
				vs = vv[0];
				vs = vs.substring(0,vv[0].indexOf("^"));
			 }
			 reps.add(vs);}
		else { reps.add(r.toString());}}
			// penser a utiliser des methodes OWLUtil ( DBUtil ) pour faciliter l'acces
		qexec.close();
	    return reps;
	  }catch(Exception e) { System.out.println(e.toString()); return null;}
}


	
}
