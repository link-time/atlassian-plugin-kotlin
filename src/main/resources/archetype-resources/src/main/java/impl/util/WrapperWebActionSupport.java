package ${package}.impl.util;

import com.atlassian.jira.web.action.JiraWebActionSupport;

import java.util.Collection;

public class WrapperWebActionSupport extends JiraWebActionSupport {
    @Override
    public void setErrorMessages(Collection errorMessages) {
        this.errorMessages = errorMessages;
    }
}
