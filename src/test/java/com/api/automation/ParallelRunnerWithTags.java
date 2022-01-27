package com.api.automation;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerWithTags {
	private static final String CLASS_PATH= "classpath:";
	private static final String DELIMITER= ",";

	
	@Test
	public void executeKarateTest() {

		Builder aRunner = new Builder();
		aRunner.path(getLocation());
		aRunner.tags(getTags());
		aRunner.parallel(5);
		
	}
	
	private List<String> getTags() {
		
		String aTags = System.getProperty("tags", "@smoke");
		List<String> aTagList = Collections.emptyList();
		if(aTags.contains(DELIMITER)) {
			String tagArray[] = aTags.split(DELIMITER);
			aTagList = Arrays.asList(tagArray);
			return aTagList;
			
		}
		aTagList = Arrays.asList(aTags);
		return aTagList;
		
	}

    private List<String> getLocation() {
		
		String aLocation = System.getProperty("location", "com/api/automation");
		List<String> aLocationList = Collections.emptyList();
		if(aLocation.contains(DELIMITER)) {
			String locationArray[] = aLocation.split(DELIMITER);
			aLocationList = Arrays.asList(locationArray);
			aLocationList.replaceAll((entry) -> {
				return CLASS_PATH + entry;
			});
			return aLocationList;
			
		}

		aLocationList = Arrays.asList(CLASS_PATH + aLocation);
		return aLocationList;
		
	}
	
	
}
