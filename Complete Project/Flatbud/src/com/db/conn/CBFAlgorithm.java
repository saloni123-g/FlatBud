package com.db.conn;

	import java.util.*;
import java.io.*;

	public class CBFAlgorithm {
	    
	    //private static final String FILE_PATH = "C:/DatasetR2.xlsx"; // File path of the college data
	    
	    // Defining the content-based filtering function
	    public static List<String> contentBasedFiltering(String city, String category, String p_name, String seller) {
	        List<String> recommendedColleges = new ArrayList<String>();
	        
	        try {
	            //File file = new File(FILE_PATH);
	            
	            int tries = 0;
	            while (tries > 0) {
	                String data[] = null;
	                
	                // Filter colleges based on the specified city
	                if (data[0].equals(city)) {
	                    String description = data[1];
	                    int collegeMarks = Integer.parseInt(data[2]);
	                    
	                    // Calculate the similarity score
	                    double similarityScore = calculateSimilarityScore(description);
	                    
	                    // Add the college to the recommended list if it has a similarity score greater than 0.5
	                    if (similarityScore > 0.5 ) {
	                        recommendedColleges.add(data[3]);
	                    }
	                }
	                tries--;
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        return recommendedColleges;
	    }
	    
	    // Calculate the similarity score using TF-IDF
	    private static double calculateSimilarityScore(String description) {
			return 0;
	      
	    }
	    public void algorithm(String city, String category, String p_name, String seller) {
	   
	        List<String> recommendedColleges = contentBasedFiltering(city,category,p_name,seller);
	        System.out.println("Recommended Flats are " + city + " Category "+category+" Flat Name "+p_name+".");
	        for (String college : recommendedColleges) {
	            System.out.println(college);
	        }
	    }	    
	    public static void main(String[] args) {
	        String city = "";
	        String category = "";
	        String p_name = "";
	        String seller = "";
	        List<String> recommendedColleges = contentBasedFiltering(city,category,p_name,seller);
	        System.out.println("Recommended Flats are " + city + " Category "+category+" Flat Name "+p_name+".");
	        for (String college : recommendedColleges) {
	            System.out.println(college);
	        }
	    }
	}

