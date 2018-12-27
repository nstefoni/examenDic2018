class SueldoPeon {
	var sueldoBruto = 0
	var sueldoNeto = 0
	var valorHora = 300
	var afiliadoAlGremio = false
	
	method sueldoBruto() {
		return sueldoBruto
	}
	
	method sueldoNeto() {
		return sueldoNeto
	}

	method precioPorHora(_valorHora) {
		valorHora = _valorHora
	} 
	
	method calculoSueldoBruto(horasTrabajadas) {
		sueldoBruto = valorHora * horasTrabajadas
		if (sueldoBruto > 30000) {
			sueldoBruto = sueldoBruto - (sueldoBruto - (30000)) * 0.02
		}
	}
	
	method calculoSueldoNeto() {
		sueldoNeto = sueldoBruto / 117 * 100
		if (afiliadoAlGremio) {
			sueldoNeto = sueldoNeto / 101 * 100
		}
	}
	
	method afiliarse() {
		afiliadoAlGremio = true
	}
}

class SueldoMedioOficial inherits SueldoPeon {
	
	override method calculoSueldoBruto(horasTrabajadas) {
		super(horasTrabajadas)
		sueldoBruto = sueldoBruto * 105 / 100
	}
}

class SueldoOficial inherits SueldoPeon {
	
	override method calculoSueldoBruto(horasTrabajadas) {
		super(horasTrabajadas)
		sueldoBruto = sueldoBruto * 110 / 100
	}
	
	method cumpleObjetivos() {
		sueldoBruto = sueldoBruto * 130 / 100
	}
}

class SueldoCapataz inherits SueldoOficial {
	
	override method calculoSueldoBruto(horasTrabajadas) {
		super(horasTrabajadas)
		sueldoBruto += 4000
	}
	
	override method afiliarse() {
		afiliadoAlGremio = false
	}
}

class Empresa {
	var sueldoMasAlto = []
	var sueldoMasBajo = []
	var empleados = []
	
	method agregarEmpleado(nombre) {
		empleados.add(nombre)
	}
}


