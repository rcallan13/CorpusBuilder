package com.rcal.corpusbuilder;

import java.util.List;

/**
 * Created by ronallan on 2019-03-25.
 */
public class CorpusManager {

    public static final String GOOGLE_HOST = "https://www.googleapis.com/customsearch/v1?";
    public static final String GOOGLE_API_KEY = "AIzaSyBdeS6nNEse3XlSeDWXFGUNAvPqjdLSz3A";
    public static final String GOOGLE_CX = "008926720231001915476:4akcjpl9cku";
    public static final String YELP_CX = "008926720231001915476:zf_u0iwkv74";
    public static final String GOOGLE_MAPS_KEY="AIzaSyBdeS6nNEse3XlSeDWXFGUNAvPqjdLSz3A";

    public CorpusManager() {

    }

    public void buildCorpus() {

        // 1. Read in the list of queries to perform
        // 2. Send each query to the NetworkService for execution
        // 3. Take the response from each request and add it to the corpus.


    }

    private List<Request> readQueriesFile() throws CorpusException {

        return null;
    }

    private void generateModelFile() throws CorpusException {

    }

}
