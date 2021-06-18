package imports.ajs

fun getCurrentUsername(): String =
    js("AJS.Meta.get('remote-user')").toString()
