package app

import component.main.MainComponent
import common.model.*
import reducers.*
import redux.*
import kotlin.reflect.KProperty1

data class AppState(
    val notifications: List<Notification> = emptyList(),
    val screen: MainComponent.Screen = MainComponent.Screen.Main,
    val chaosMode: Boolean = false
)


fun <S, A, R> combinePropertyReducers(reducers: Map<KProperty1<S, R>, Reducer<*, A>>): Reducer<S, A> {
    return combineReducers(reducers.mapKeys { it.key.name })
}

fun appReducers() = combinePropertyReducers(
    mapOf(
        AppState::notifications to ::notifications,
        AppState::screen to ::screen,
        AppState::chaosMode to ::chaosMode
    )
)
