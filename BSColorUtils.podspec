Pod::Spec.new do |spec|
  spec.name = "BSColorUtils"
  spec.version = "1.0.2"
  spec.summary = "Color utilities to make dealing with UIColor easier."
  spec.homepage = "https://github.com/SlayterDev/BSColorUtils.git"
  spec.license = { type: 'MIT', file: 'LICENSE.txt' }
  spec.authors = { "Bradley Slayter" => 'slayterdevelopment@gmail.com' }

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/jakecraige/RGB.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "BSColorUtils/**/*.{h,swift}"
end
