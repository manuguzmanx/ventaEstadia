package com.example.entities;

public class DetalleVenta {
	
	private Integer idDetalleVenta;
	private double efectivo;
	private double cambio;
	private double impuesto;
	
	public Integer getIdDetalleVenta() {
		return idDetalleVenta;
	}
	public void setIdDetalleVenta(Integer idDetalleVenta) {
		this.idDetalleVenta = idDetalleVenta;
	}
	public double getEfectivo() {
		return efectivo;
	}
	public void setEfectivo(double efectivo) {
		this.efectivo = efectivo;
	}
	public double getCambio() {
		return cambio;
	}
	public void setCambio(double cambio) {
		this.cambio = cambio;
	}
	public double getImpuesto() {
		return impuesto;
	}
	public void setImpuesto(double impuesto) {
		this.impuesto = impuesto;
	}
	
	
}
