# Limpiar registros previos de usuarios
Prestamo.destroy_all
Recurso.destroy_all
Usuario.destroy_all

### CUENTAS DE TESTEO
# 1. Usuario Estudiante
Usuario.create!(
  email: "estudiante@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :estudiante # o 'estudiante' según como tengas configurado tu enum
)

# 2. Usuario Encargado
Usuario.create!(
  email: "encargado@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :encargado # o 'encargado'
)

# 3. Usuario Administrador
Usuario.create!(
  email: "admin@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :admin # o 'admin'
)

### CUENTAS RANDOM
puts "Creando usuarios de prueba adicionales..."

# Estudiantes
Usuario.create!(
  email: "maria.gonzalez@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :estudiante
)

Usuario.create!(
  email: "carlos.perez@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :estudiante
)

# Encargados
Usuario.create!(
  email: "felipe.taller@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :encargado
)

# Administrador
Usuario.create!(
  email: "profesor.admin@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :admin
)

recursos = [
  # Herramientas Eléctricas (HE)
  { codigo: "HE-001", nombre: "Amoladora Angular 4.5\"", tipo: "HE", cantidad: 5, ubicacion: "Estante A1", observaciones: "Incluye llave de ajuste y guarda de protección", fecha_vencimiento: nil },
  { codigo: "HE-002", nombre: "Taladro Percutor 13mm", tipo: "HE", cantidad: 4, ubicacion: "Estante A2", observaciones: "Incluye mango auxiliar", fecha_vencimiento: nil },
  { codigo: "HE-003", nombre: "Sierra Caladora 650W", tipo: "HE", cantidad: 3, ubicacion: "Estante A2", observaciones: "Requiere hojas de corte tipo T", fecha_vencimiento: nil },
  { codigo: "HE-004", nombre: "Pistola de Calor 2000W", tipo: "HE", cantidad: 2, ubicacion: "Estante A3", observaciones: "Ajuste de temperatura variable", fecha_vencimiento: nil },

  # Sets / Juegos (SE)
  { codigo: "SE-001", nombre: "Set de Dados y Chicharra 1/2\" (24 piezas)", tipo: "SE", cantidad: 6, ubicacion: "Caja de Herramientas 1", observaciones: "Maletín plásticos completo", fecha_vencimiento: nil },
  { codigo: "SE-002", nombre: "Juego de Llaves Combinadas (8 a 22mm)", tipo: "SE", cantidad: 4, ubicacion: "Caja de Herramientas 2", observaciones: "Soporte organizador de tela", fecha_vencimiento: nil },
  { codigo: "SE-003", nombre: "Set de Destornilladores Aislados 1000V", tipo: "SE", cantidad: 5, ubicacion: "Estante B1", observaciones: "Apto para trabajos eléctricos", fecha_vencimiento: nil },
  { codigo: "SE-004", nombre: "Juego de Llaves Allen Milimétricas", tipo: "SE", cantidad: 8, ubicacion: "Caja de Herramientas 3", observaciones: "9 piezas en estuche", fecha_vencimiento: nil },

  # Herramientas Manuales (HM)
  { codigo: "HM-001", nombre: "Martillo de Peña 16 oz", tipo: "HM", cantidad: 10, ubicacion: "Panel Principal", observaciones: "Mango de fibra de vidrio", fecha_vencimiento: nil },
  { codigo: "HM-002", nombre: "Alicante Corte Diagonal 6\"", tipo: "HM", cantidad: 8, ubicacion: "Panel Principal", observaciones: "Aislamiento antideslizante", fecha_vencimiento: nil },
  { codigo: "HM-003", nombre: "Llave Ajustable (Francesa) 10\"", tipo: "HM", cantidad: 6, ubicacion: "Panel Principal", observaciones: "Apertura máxima 30mm", fecha_vencimiento: nil },

  # Instrumentos de Medición (MD)
  { codigo: "MD-001", nombre: "Pie de Metro Digital (Calibre)", tipo: "MD", cantidad: 6, ubicacion: "Armario de Calibración", observaciones: "Rango 0-150mm. Sensibilidad 0.01mm", fecha_vencimiento: 1.year.from_now },
  { codigo: "MD-002", nombre: "Micrómetro de Exteriores 0-25mm", tipo: "MD", cantidad: 3, ubicacion: "Armario de Calibración", observaciones: "Incluye patrón de ajuste", fecha_vencimiento: 6.months.from_now },
  { codigo: "MD-003", nombre: "Goniómetro de Precisión", tipo: "MD", cantidad: 2, ubicacion: "Armario de Calibración", observaciones: "Para medición de ángulos", fecha_vencimiento: nil },

  # Equipo de Diagnóstico (DI)
  { codigo: "DI-001", nombre: "Multímetro Digital Automotriz", tipo: "DI", cantidad: 4, ubicacion: "Estante C1", observaciones: "Incluye puntas de prueba y termopar", fecha_vencimiento: nil },
  { codigo: "DI-002", nombre: "Scanner Diagnóstico OBD2", tipo: "DI", cantidad: 2, ubicacion: "Estante C1", observaciones: "Actualizado con software multimarca", fecha_vencimiento: nil },

  # Equipo de Protección / EPP (EP)
  { codigo: "EP-001", nombre: "Mascara de Soldar Fotosensible", tipo: "EP", cantidad: 5, ubicacion: "Estante D1", observaciones: "Sombra DIN 9 a 13 ajustable", fecha_vencimiento: 2.years.from_now },
  { codigo: "EP-002", nombre: "Lentes de Seguridad Claros", tipo: "EP", cantidad: 25, ubicacion: "Caja EPP", observaciones: "Anti-empañante", fecha_vencimiento: nil },

  # Insumos / Consumibles (IN)
  { codigo: "IN-001", nombre: "Disco de Corte para Metal 4.5\"", tipo: "IN", cantidad: 50, ubicacion: "Bodega Insumos", observaciones: "Grosor 1.2mm", fecha_vencimiento: nil },
  { codigo: "IN-002", nombre: "Electrodos 6011 3/32\"", tipo: "IN", cantidad: 100, ubicacion: "Bodega Insumos", observaciones: "Caja de electrodos para soldadura", fecha_vencimiento: nil }
]

recursos.each do |rec|
  Recurso.create!(rec)
end