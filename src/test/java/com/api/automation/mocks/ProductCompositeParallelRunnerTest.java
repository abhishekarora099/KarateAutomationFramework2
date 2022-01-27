package com.api.automation.mocks;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.mockserver.client.MockServerClient;
import org.mockserver.model.HttpRequest;
import org.mockserver.model.HttpResponse;
import org.mockserver.model.MediaType;
import org.mockserver.model.Parameter;
import org.mockserver.netty.MockServer;
import com.intuit.karate.Runner.Builder;
import com.intuit.karate.Results;



@TestInstance(Lifecycle.PER_CLASS)
public class ProductCompositeParallelRunnerTest {
	
	private org.mockserver.netty.MockServer server;
	private MockServerClient client;
	
	@BeforeAll
	public void setUp() {
		server = new MockServer(9092);
		client = new MockServerClient("localhost",server.getLocalPort());
		
	}
	
	@AfterAll
	public void tearDown() {
		if(server.isRunning())
			server.stop();
		if(!client.hasStopped())
			client.stop();
	}
	
	@Test
	public void runTest() {
		mockProductService();
		mockReviewService();
		Builder aBuilder = new Builder();
		aBuilder.path("classpath:com/api/automation/mocks/ProductCompositeServiceTest.feature");
		Results result =aBuilder.parallel(1);
		Assertions.assertEquals(0, result.getFailCount());
		
		
	}

	private void mockProductService() {
		String body ="{\r\n"
				+ "    \"name\": \"name-123\",\r\n"
				+ "    \"weight\": 123,\r\n"
				+ "    \"productID\": 123\r\n"
				+ "}";
			
		
		HttpRequest interceptReq = HttpRequest.request("/product/{productId}").withPathParameter(Parameter.param("productId","123"));
		HttpResponse mockResponse = HttpResponse.response(body).withContentType(MediaType.APPLICATION_JSON);
		client.when(interceptReq).respond(mockResponse);
	}
	
	private void mockReviewService() {
		String body ="[\r\n"
				+ "    {\r\n"
				+ "        \"productId\": 123,\r\n"
				+ "        \"reviewId\": 456,\r\n"
				+ "        \"author\": \"John\",\r\n"
				+ "        \"subject\": \"Good\",\r\n"
				+ "        \"content\": \"This is a good product\"\r\n"
				+ "    },\r\n"
				+ "    {\r\n"
				+ "        \"productId\": 123,\r\n"
				+ "        \"reviewId\": 741,\r\n"
				+ "        \"author\": \"Todd\",\r\n"
				+ "        \"subject\": \"Very Good\",\r\n"
				+ "        \"content\": \"This is a fantastic product\"\r\n"
				+ "    }\r\n"
				+ "]";
			
		
		HttpRequest interceptReq = HttpRequest.request("/review/{productId}").withPathParameter(Parameter.param("productId","123"));
		HttpResponse mockResponse = HttpResponse.response(body).withContentType(MediaType.APPLICATION_JSON);
		client.when(interceptReq).respond(mockResponse);
	}
	
	
}
