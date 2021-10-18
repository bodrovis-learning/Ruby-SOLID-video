class BackupManagerInterface
  def create
    puts "Creating backup..."
    "My Backup at #{Time.now}"
  end

  def save(backup)
    puts "Saving #{backup} to external drive..."
  end

  def restore(backup)
    puts "Restoring #{backup}..."
  end
end

class BackupViewerInterface
  def list
    puts "Collecting all available backups..."
    [
      "My Backup at #{Time.now}",
      "Old Backup at #{Time.new(2021, 8, 25)}"
    ]
  end

  def pretty_print(backups)
    puts "Printing in pretty format..."
    puts backups.join("\n")
  end
end

class Backuper
  def initialize
    @interface = BackupManagerInterface.new
  end

  def make_backup
    backup = @interface.create
    @interface.save backup
  end
  
  def restore_backup(backup)
    @interface.restore backup
  end
end

class BackupViewer
  def initialize
    @interface = BackupViewerInterface.new
  end

  def view
    backups = @interface.list
    @interface.pretty_print backups
  end
end

backuper = Backuper.new
backuper.make_backup

viewer = BackupViewer.new
viewer.view