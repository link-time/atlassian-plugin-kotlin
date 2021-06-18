package ${package}.impl.action

import ${package}.impl.util.WrapperWebActionSupport
import javax.inject.Inject

class ModuleAction
@Inject
constructor() : WrapperWebActionSupport() {

    @Suppress("unused") // velocity
    var frontendDevMode: Boolean = System.getProperty("frontend.devMode").toBoolean()

}
