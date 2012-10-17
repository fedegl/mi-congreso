module InitiativesHelper

  def subjects(initiative, options={})
    if initiative.subjects.present?
      initiative.subjects.map do |subject|
        content_tag(options[:tag], subject.name, class: options[:class])
      end.join.html_safe
    end
  end

  def link_to_sort(text, sort, options={})
    if params[:subject_id].present?
      path = subject_initiatives_path(params[:subject_id], order: sort)
    else
      path = initiatives_path(order: sort)
    end

    options[:class] = [options[:class], "active"].join(" ") if sort == params[:order]
    link_to text, path, options
  end

  def link_to_sponsors(initiative)
    text = ""
    text << initiative.member.name
    text << t('initiatives.and_co_sponsors', count: initiative.sponsors_count.to_i) if initiative.sponsors_count.to_i > 0
    link_to text, initiative.member
  end
end