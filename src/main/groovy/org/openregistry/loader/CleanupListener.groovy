package org.openregistry.loader

import org.springframework.batch.core.JobExecution
import org.springframework.batch.core.annotation.AfterJob
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.JavaMailSenderImpl
import org.springframework.mail.javamail.MimeMessageHelper

import javax.annotation.Resource

class CleanupListener {
    @Resource(name = "sorConfiguration")
    Map<String, SorConfiguration> sorConfigurationMap

    @AfterJob
    void cleanup(JobExecution jobExecution) {
        SorConfiguration sorConfiguration = sorConfigurationMap[jobExecution.jobParameters.getString("sor")]

        if (sorConfiguration.notificationConfiguration.emailConfiguration) {
            EmailNotificationConfiguration emailNotificationConfiguration = sorConfiguration.notificationConfiguration.emailConfiguration
            JavaMailSender mailSender = new JavaMailSenderImpl().with {
                host = emailNotificationConfiguration.host
                port = emailNotificationConfiguration.port
                protocol = "smtps"
                username = emailNotificationConfiguration.username
                password = emailNotificationConfiguration.password
                javaMailProperties = new Properties().with {
                    setProperty("mail.smtps.auth", true)
                    setProperty("mail.smtps.starttls.enable", true)
                    setProperty("mail.smtps.debug", false)

                    return it
                }
                return it
            }
            def message = mailSender.createMimeMessage().with {
                new MimeMessageHelper(it, true).with {
                    setFrom(emailNotificationConfiguration.from)
                    addBcc(emailNotificationConfiguration.to)
                    subject = "OpenRegistry Loader Job"
                    text = """
The job completed at ${new Date()}
"""
                }
                return it
            }
            mailSender.send(message)
        }
    }
}