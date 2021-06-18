package component.pages.mainPage

import app.AppState
import react.*
import react.dom.*
import react.redux.rConnect
import redux.*
import imports.ajs.getCurrentUsername

interface MainPageStateProps : RProps {
    var chaosMode: Boolean
}

interface MainPageDispatchProps : RProps
interface MainPageProps : MainPageStateProps, MainPageDispatchProps

val mainPage: RClass<MainPageProps> =
    rConnect<AppState, RAction, WrapperAction, RProps, MainPageStateProps, MainPageDispatchProps, MainPageProps>(
        { state, _ ->
            chaosMode = state.chaosMode
        },
        { _, _ -> }
    )(MainPage::class.js.unsafeCast<RClass<MainPageProps>>())

class MainPage(props: MainPageProps) : RComponent<MainPageProps, MainPage.State>(props) {


    override fun RBuilder.render() {
        div {
            span { +"Hello ${getCurrentUsername()}, have fun creating an awesome app!" }
        }
    }

    interface State : RState {

    }

}
