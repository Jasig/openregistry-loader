package org.openregistry.identifier

import groovy.json.JsonBuilder
import groovyx.net.http.ContentType
import groovyx.net.http.HttpResponseException
import groovyx.net.http.RESTClient
import org.apache.http.HttpStatus
import org.openregistry.core.domain.sor.SorPerson
import org.springframework.beans.factory.InitializingBean

class IdMatchService implements InitializingBean {
    IdMatchServiceConfig idMatchServiceConfig
    RESTClient restClient

    @Override
    void afterPropertiesSet() throws Exception {
        assert idMatchServiceConfig != null
        restClient = new RESTClient(idMatchServiceConfig.baseUrl)
        restClient.auth.basic idMatchServiceConfig.username, idMatchServiceConfig.password
    }

    IdMatchServiceResponse getIdMatchServiceResponse(SorPerson sorPerson) {
        //TODO: really implement this
        try {
            def resp = restClient.get(path: "${idMatchServiceConfig.version}/people/${sorPerson.sourceSor.toLowerCase()}/${sorPerson.sorId}")
            return new IdMatchServiceResponse(status: IdMatchServiceResponse.Status.OK, referenceId: sorPerson.sorId, fullResponse: [:])
        } catch (HttpResponseException e) {
            switch (e.statusCode) {
                case HttpStatus.SC_NOT_FOUND:
                    return new IdMatchServiceResponse(status: IdMatchServiceResponse.Status.NOT_FOUND, fullResponse: e.response)
                    break
            }
        }
    }

    IdMatchServiceResponse putIdMatchServiceResponse(SorPerson sorPerson) {
        // TODO: really implement this
        try {
            def builder = new JsonBuilder()
            builder.sorAttributes {
                names sorPerson.names.collect {["type": it.type, "given": it.given, "family": it.family]}
                identifiers([["type": "sor", "identifier": sorPerson.sorId]])
            }
            def resp = restClient.put(
                    path: "${idMatchServiceConfig.version}/people/${sorPerson.sourceSor.toLowerCase()}/${sorPerson.sorId}",
                    body: builder.toString(),
                    requestContentType: ContentType.JSON
            )
            return new IdMatchServiceResponse(status: IdMatchServiceResponse.Status.OK, referenceId: sorPerson.sorId, fullResponse: [:])
        } catch (def e) {
            println "here we are"
        }
    }
}

class IdMatchServiceResponse {
    Status status
    String referenceId
    def fullResponse

    enum Status {OK, NOT_FOUND, CREATED, MULTIPLE_CHOICES, ACCEPTED}
}

class IdMatchServiceConfig {
    String baseUrl
    String username
    String password
    String version
}