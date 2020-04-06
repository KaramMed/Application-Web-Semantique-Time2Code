


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import OWL.OWLUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Statistiques
 */
@WebServlet("/Statistiques")
public class Statistiques extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Statistiques() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    // methode contenant la procedure de recuperer les informations
    public void procedure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	// on va prendre le nombre de fois chaque examen passé
    	ArrayList<String> examens = new ArrayList<String>();
    	ArrayList<Integer> nombres = new ArrayList<Integer>();
    	ArrayList<Integer> nb_candidats = new ArrayList<Integer>();
    	ArrayList<Integer> nb_participants = new ArrayList<Integer>();
    	
    	String requete="PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
    			"PREFIX owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
    			"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
    			"PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\r\n" + 
    			"PREFIX :<http://www.semanticweb.org/midok/ontologies/2019/11/organisation#>\r\n" + 
    			"SELECT ?examen (count(?examen) as ?count)\r\n" + 
    			"WHERE {\r\n" + 
    			"    ?participant :passe ?examen .\r\n" + 
    			"}\r\n" + 
    			"GROUP BY ?examen";
    	
    	for(String v : OWLUtil.getVariable(requete,"examen") ) {
    		examens.add(v);
    	}
    	
    	for(String v : OWLUtil.getVariable(requete,"count") ) {
    		nombres.add(Integer.parseInt(v));
    	}
    	
    	// configuration des attributs
    	request.setAttribute("examens",examens);
    	request.setAttribute("nombres",nombres);
    	
    	// on prends le nombre des candidats et le nombre de participants
    	requete = "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
    			"PREFIX owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
    			"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
    			"PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\r\n" + 
    			"PREFIX :<http://www.semanticweb.org/midok/ontologies/2019/11/organisation#>\r\n" + 
    			"SELECT (count(?candidature) as ?count) WHERE \r\n" + 
    			"{ ?candidat :depose ?candidature . ?candidature rdf:type :Candidature . ?candidature :saison ?annee \r\n" + 
    			". FILTER(?annee=2018) }";
    	
    	for(String v : OWLUtil.getVariable(requete,"count") ) {
    		nb_candidats.add(Integer.parseInt(v));
    	}
    	
    	requete = "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
    			"PREFIX owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
    			"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
    			"PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\r\n" + 
    			"PREFIX :<http://www.semanticweb.org/midok/ontologies/2019/11/organisation#>\r\n" + 
    			"SELECT (count(?participants) as ?count) WHERE \r\n" + 
    			"{ ?participants :participe ?participation . ?participation rdf:type :Participation . ?participation :saison ?annee \r\n" + 
    			". FILTER(?annee=2018) }";
    	
    	for(String v : OWLUtil.getVariable(requete,"count") ) {
    		nb_participants.add(Integer.parseInt(v));   		
    	}
    	
    	// configuration des attributs
    	request.setAttribute("nb_participants",nb_participants);
    	request.setAttribute("nb_candidats",nb_candidats);
    	
    	// redirection
    	getServletContext().getRequestDispatcher("/Statistiques.jsp").forward(request,response);
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procedure(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
