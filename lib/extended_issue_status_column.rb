class ExtendedIssueStatusColumn < ExtendedColumn

    def initialize(status)
        self.name = "#{status.name.downcase.gsub(%r{[^a-z0-9_]}i, '_')}_issues".to_sym
        self.caption = l(:label_issue_status_column, :status => status.name)
        self.align = :center

        @css_classes = "status-#{status.position}"
        @status = status
    end

    def value(project)
        Issue.count(:conditions => [ "project_id = ? AND status_id = ?", project.id, @status.id ])
    end

end
