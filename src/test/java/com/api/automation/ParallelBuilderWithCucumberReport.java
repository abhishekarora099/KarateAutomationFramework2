package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import org.apache.commons.io.FileUtils;
import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {
	
	@Test
	public void executeKarateTest() {
		
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation");
		//aRunner.tags("@smoke");
		Results result=aRunner.outputCucumberJson(true).parallel(5);
		generateCucumberReport(result.getReportDir());
		System.out.println("Total Feature==>" +result.getFeaturesTotal());
		System.out.println("Total Scenario==>" +result.getScenariosTotal());
		System.out.println("Total Pass Scenarios==>" +result.getScenariosPassed());

        Assertions.assertEquals(0,result.getFailCount());
		
		
	}

	private void generateCucumberReport(String reportDirLocation) {
		File reportDir = new File(reportDirLocation);
		Collection<File> jsonCollection= FileUtils.listFiles(reportDir, new String[] {"json"}, true);
		List<String> jsonFiles = new ArrayList<String>(jsonCollection.size());
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		
		Configuration configuration = new Configuration(reportDir, "KarateRun");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles,configuration);
		reportBuilder.generateReports();
		
		
		
		
		
	}
	
}
