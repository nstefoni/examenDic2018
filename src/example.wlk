import retenciones.*

class SueldoPeon {

	var valorHora = 300
	var property horasTrabajadas = 0
	var afiliadoAlGremio = false

	method precioPorHora(_valorHora) {
		valorHora = _valorHora
	}

	method sueldoBruto() {
		return valorHora * horasTrabajadas
	}

	method sueldoNeto() {
		return retencion.aplicar(self)
	}

	method afiliadoAlGremio() {
		return afiliadoAlGremio
	}

	method afiliadoAlGremio(seAfilia) {
		afiliadoAlGremio = seAfilia
	}

	method tipo() {
		return "Peon"
	}

}

class SueldoMedioOficial inherits SueldoPeon {

	override method sueldoBruto() {
		var sueldoBruto = super()
		return sueldoBruto * 1.05
	}

	override method tipo() {
		return "Medio oficial"
	}

}

class SueldoOficial inherits SueldoPeon {

	var property cumplioObjetivos = false

	override method sueldoBruto() {
		var sueldoBruto = super()
		return sueldoBruto + (sueldoBruto * 10 / 100) + self.plusObjetivos(sueldoBruto)
	}

	method plusObjetivos(sueldoBruto) {
		if (cumplioObjetivos) {
			return sueldoBruto * 30 / 100
		}
		return 0
	}

	override method tipo() {
		return "Oficial"
	}

}

class SueldoCapataz inherits SueldoOficial {

	const plusSalario = 4000

	override method sueldoBruto() {
		return super() + plusSalario
	}

	override method afiliadoAlGremio() {
		return false
	}

	override method tipo() {
		return "Capataz"
	}

}

class Empresa {

	var empleados = []

	method agregarEmpleado(nombre) {
		empleados.add(nombre)
	}

	method sueldoMasAlto() {
		var empleado = empleados.max({ empleado => empleado.sueldoNeto() })
		return empleado.sueldoNeto()
	}

	method sueldoMasBajo() {
		var empleado = empleados.min{ e => e.sueldoNeto() }
		return empleado.sueldoNeto()
	}

	method cantidadTotalEmpleados() {
		return empleados.size()
	}

	method cantidadEmpleados(tipoEmpleado) {
		return self.empleadosTipo(tipoEmpleado).size()
	}

	method empleadosTipo(tipoEmpleado) {
		return empleados.filter({ e => e.tipo().equals(tipoEmpleado) })
	}

	method promedioSueldos() {
		// suma de todo / la cantidad de elementos que sumé
		var totalSueldos = empleados.sum({ e => e.sueldBruto() })
		return totalSueldos / empleados.size()
	}

	method promedioSueldos(tipoEmpleado) {
		var empleadosDeUnTipo = self.empleadosTipo(tipoEmpleado)
		var totalSueldos = empleadosDeUnTipo.sum({ e => e.sueldBruto() })
		return totalSueldos / empleadosDeUnTipo.size()
	}

}