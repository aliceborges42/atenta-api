class UpdateResolvedComplaintResolutionDate < ActiveRecord::Migration[7.1]
  def up
    Complaint.where(status: 'Resolvido').where(resolution_date: nil).find_each do |complaint|
      complaint.update(resolution_date: complaint.created_at.to_date)
    end
  end

  def down
    # Se você precisar reverter essa migração, você pode implementar o código de reversão aqui.
    # No entanto, se isso não for necessário, você pode deixar esse método vazio.
  end
end
