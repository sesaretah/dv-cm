module ApplicationHelper

  def controls
    @options = [
      [t(:allow), 1],
      [t(:deny) , 0]
    ]
    return @options
  end

  def rcontrols(s)
    if !s.blank?
      @options = [t(:allow),t(:deny)]
      return @options[s-1]
    else
      return t(:deny)
    end
  end

  def ability
    @options = [
      [t(:has), 1],
      [t(:has_not) , 2]
    ]
    return @options
  end

  def existence
    @options = [
      [t(:is_not), 1],
      [t(:is) , 2]
    ]
    return @options
  end

  def rability(s)
    @options = ['has','has_not']
    return @options[s-1]
  end

  def permit_by_workflow(article,user,caller)
    if article.workflow_state.blank?
      return true
    end
    @role = Role.find_by_id(user.current_role_id)
    if !@role.blank?
      if article.workflow_state.role_id != @role.id
        return false
      end
    end
    @items = article.workflow_state.editable.split(',')
    @flag = false
    for item in @items
      if !item.blank?
        if item == caller+'_'+'checkbox'
          @flag = true
        end
      end
    end
    if @flag
      return true
    else
      return false
    end
  end

  def owner(obj, user)
    if obj.user_id == user.id
      return true
    else
      return false
    end
  end


  def grant_access(ward, user)
    if user.assignments.blank?
      return false
    end
    @flag = 0
    for assignment in user.assignments
      @ac = AccessControl.where(role_id: assignment.role_id).first
      if !@ac.blank?
        @flag = @flag + @ac["#{ward}"].to_i
      end
    end
    if @flag == 0
      return false
    else
      return true
    end
  end

end
