module ApplicationHelper
  def edit_link(path)
    link_to fa_icon("pencil"),
              path,
              class: 'btn btn-info btn-sm px-3',
              title: "edit"
  end
  
  
  def delete_link(path)
    link_to fa_icon("trash"),
              path,
              method: :delete,
              data: { confirm: "Are you sure?" },
              class: 'btn btn-danger btn-sm px-3',
              title: "delete"
  end  
end
