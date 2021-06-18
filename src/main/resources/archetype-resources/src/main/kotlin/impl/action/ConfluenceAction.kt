package ${package}.impl.action

import com.atlassian.confluence.core.ConfluenceActionSupport
import javax.inject.Inject

class ConfluenceAction @Inject constructor() :
    ConfluenceActionSupport() {

    @Suppress("unused") // velocity
    var frontendDevMode: Boolean = System.getProperty("frontend.devMode").toBoolean()

    override fun doDefault(): String {
        return super.doDefault()
    }

    override fun execute(): String {
        return super.execute()
    }
}