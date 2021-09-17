package rest;

import java.time.LocalDate;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.entities.DetalleVenta;
import com.example.entities.Ticket;
import com.example.entities.Venta;

@RestController
@RequestMapping("/")
public class EstadiaREST {
	
	public ResponseEntity <Venta> getVenta(){
		Venta venta = new Venta();
		venta.setId(1);
		venta.setFechaVenta(null);
		venta.setFechaVenta(LocalDate.now());
		venta.setTotalVenta(2500);
		return ResponseEntity.ok(venta);
	}
	
	public ResponseEntity <DetalleVenta> getDetalleVenta(){
		DetalleVenta detalleVenta = new DetalleVenta();
		detalleVenta.setIdDetalleVenta(1);
		detalleVenta.setEfectivo(3000);
		detalleVenta.setCambio(500);
		detalleVenta.setImpuesto(16);
		return ResponseEntity.ok(detalleVenta);
	}
	
	public ResponseEntity <Ticket> getTicket(){
		Ticket ticket = new Ticket();
		ticket.setIdTicket(1);
		ticket.setFormaPago("Tarjeta");
		ticket.setRazonSocial("GameDev");
		ticket.setDireccion("Enrique Segoviano");
		return ResponseEntity.ok(ticket);
		
	}
	
	@GetMapping
	public String hello() {
		return "Hello world!";
	}
}
