

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OWL.OWLUtil;

/**
 * Servlet implementation class GeniusADev
 */
@WebServlet("/GeniusADev")
public class GeniusADev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeniusADev() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
 // methode contenant la procedure de recuperer les informations
    public void procedure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	// on prends la date creation de GeniusADev
    	String datec="";
    	
    	String requete="PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
    			"PREFIX owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
    			"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
    			"PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\r\n" + 
    			"PREFIX :<http://www.semanticweb.org/midok/ontologies/2019/11/organisation#>\r\n" + 
    			"SELECT ?date\r\n" + 
    			"	WHERE { :GeniusADev :datecreation ?date }";
    	
    	for(String v : OWLUtil.getVariable(requete,"date") ) {
    		datec = v;
    	}
    	
    	
    	// configuration des attributs
    	request.setAttribute("datec",datec);
    	
    	// nom et prenom du fondateur
    	String nomf="",prenomf="";
    	
    	requete="PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
    			"PREFIX owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
    			"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
    			"PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\r\n" + 
    			"PREFIX :<http://www.semanticweb.org/midok/ontologies/2019/11/organisation#>\r\n" + 
    			"SELECT ?nom ?prenom\r\n" + 
    			"	WHERE { ?f :cree :GeniusADev . ?f :nom_famille ?nom . ?f :prenom ?prenom }";
    	
    	for(String v : OWLUtil.getVariable(requete,"nom") ) {
    		nomf = v;
    	}
    	for(String v : OWLUtil.getVariable(requete,"prenom") ) {
    		prenomf = v;
    	}
    	
    	// configuration des attributs
    	request.setAttribute("nomf",nomf);
    	request.setAttribute("prenomf",prenomf);
    	
    	// redirection
    	getServletContext().getRequestDispatcher("/GeniusADev.jsp").forward(request,response);
    	
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
