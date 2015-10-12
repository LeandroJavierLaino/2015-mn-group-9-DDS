package ar.edu.domain.email

interface EmailSender {
	def void send(Email email)
}