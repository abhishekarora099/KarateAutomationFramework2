package com.api.automation.getrequest.queryParameters;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestQueryParameterRunner {
	
	@Test
	public Karate runTest() {
		
		return Karate.run("queryParameter").relativeTo(getClass());
	}
	
	

}
