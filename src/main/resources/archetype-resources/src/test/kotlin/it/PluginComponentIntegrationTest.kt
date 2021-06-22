package it

import org.junit.Test
import io.restassured.RestAssured

class PluginComponentIntegrationTest {

    @Test
    fun indexSuccess() {
        RestAssured.baseURI = "http://localhost"
#if( $atlassianApp == "jira" || $atlassianApp == "jira-insight"  )
        RestAssured.port = 2990
#end
#if( $atlassianApp == "confluence" )
        RestAssured.port = 1990
#end
        RestAssured.enableLoggingOfRequestAndResponseIfValidationFails()

        RestAssured.given()
            .get()
            .then()
            .statusCode(200)
    }

}
