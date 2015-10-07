package uiWeb

import java.io.IOException
import javax.servlet.ServletException
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import org.eclipse.jetty.server.Handler
import org.eclipse.jetty.server.Request
import org.eclipse.jetty.server.Server
import org.eclipse.jetty.server.handler.AbstractHandler
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.After
import org.junit.Before
import org.junit.Test


@Accessors
class TestUIWeb {
	private static final int PUERTO_HTTP = 9000;
	private static final String URL_SERVICIO = "http://localhost:" + PUERTO_HTTP;

	/** El server http que servirá para hacer un mock del servicio real */
	private Server httpServer
	Handler handler
//	HttpClient client

	@Before
	def public void init() throws Exception {

		//iniciamos el servidor mock
		httpServer = new Server(PUERTO_HTTP);
		httpServer.start();
		handler = new AbstractHandler {
			override handle(String target, Request baseRequest, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
				response.setContentType("txt/html")
				response.setStatus(HttpServletResponse.SC_OK)
				request.setHandled(true)
			}

			def void setHandled(HttpServletRequest request, boolean b) {
				request.handled = b
			}
		}
		
	}

	@After
	def public void tearDown() throws Exception {
		httpServer.stop();
	}

	@Test
	def void testInicioLean() {
		httpServer.setHandler(handler)
		 

		// Hasta aca levanta el servidor(es igual para cualquier test), despues
		// no se como hacer que se comunique con el cliente y hacer lo que necesite para probar.
				
//		var HttpClient client = new HttpClient()
//		var HttpMethod method = new GetMethod(URL_SERVICIO)
//		var int status = client.executeMethod(method)
//		var String respuesta = method.getResponseBodyAsString()

		assertEquals(HttpServletResponse.SC_OK, status)
//		assertEquals("Leandro",respuesta)
	}

	@Test
	def void testInicioNico() {
		httpServer.setHandler(handler)
		

//		var HttpClient client = new HttpClient()
//		var HttpMethod method = new GetMethod(URL_SERVICIO)
//		var int status = client.executeMethod(method)
//		var String respuesta = method.getResponseBodyAsString()

		assertEquals(HttpServletResponse.SC_OK, status)
//		assertEquals("Nicolas",respuesta)
	}
}
