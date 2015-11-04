module RedmineImpersonate
  def self.hook
    require_dependency "#{self.name.underscore}/hook"
  end

  def self.install
    RedmineImpersonate.hook
  end
end
