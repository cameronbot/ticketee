module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View",
      "edit" => "Edit",
      "delete" => "Delete"
    }
  end
end
