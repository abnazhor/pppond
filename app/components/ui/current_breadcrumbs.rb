module Components
  module Ui
    class CurrentBreadcrumbs < Components::Base
      def view_template(&)
        Breadcrumb do
          BreadcrumbList do
            Current.breadcrumbs.each do |breadcrumb|
              if breadcrumb == Current.breadcrumbs.last
                BreadcrumbItem do
                  BreadcrumbPage(class: "text-2xl font-medium") { breadcrumb.name }
                end
              else
                BreadcrumbItem do
                  BreadcrumbLink(href: breadcrumb.path, class: "text-2xl font-medium") { breadcrumb.name }
                end

                BreadcrumbSeparator { "/" }
              end
            end
          end
        end
      end
    end
  end
end
