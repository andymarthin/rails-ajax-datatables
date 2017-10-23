class UserDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      name: {source: "User.name", cond: :like, searchable: true, orderable: true},
      phone: {source: "User.phone", cond: :like },
      address: {source: "User.address"}
    }
  end

  def data
    records.map do |record|
      {
        name: record.name,
        phone: record.phone,
        address: record.address,
        # 'DT_RowId' => record.id, # This will set the id attribute on the corresponding <tr> in the datatable
      }
    end
  end

  private

  def get_raw_records
    User.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
