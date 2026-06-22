module Components
  class Nav < Components::Base
    include Phlex::Rails::Helpers::LinkTo

    def initialize(params:)
      @params = params
    end

    def view_template(&)
      div(class: "fixed top-0 left-0 right-0 z-10") do
        nav(class: "grid grid-cols-3 items-center gap-2 p-3 px-5 container mx-auto bg-white") do
          div(class: "col-span-1") do
            Link(href: root_path, variant: :link, class: "italic px-0 mr-3") do
              "● pond"
            end
          end

          div(class: "col-span-1") do
            form(action: search_path, method: :get, class: "w-xs mx-auto") do
              input(type: "search", name: "q", placeholder: "Search...", value: @params[:q], class: "text-center flex h-9 w-full rounded-full border bg-background px-3 py-1 text-sm shadow-xs transition-[color,box-shadow] border-border ring-0 ring-ring/0 placeholder:text-muted-foreground disabled:cursor-not-allowed disabled:opacity-50 file:border-0 file:bg-transparent file:text-sm file:font-medium aria-disabled:cursor-not-allowed aria-disabled:opacity-50 aria-disabled:pointer-events-none focus-visible:outline-none focus-visible:ring-ring/50 focus-visible:ring-2 focus-visible:border-ring focus-visible:shadow-sm")
            end
          end

          div(class: "col-span-1") do
            div(class: "flex gap-3 items-center justify-end") do
              if authenticated?
                DropdownMenu(options: { placement: "bottom-end" }) do
                  DropdownMenuTrigger(class: "w-full") do
                    Button(variant: :link) { current_user.to_param }
                  end

                  DropdownMenuContent do
                    DropdownMenuLabel { "My Account" }
                    DropdownMenuItem(href: user_path(current_user.to_param)) { "Profile" }
                    DropdownMenuSeparator
                    DropdownMenuItem(href: sign_out_path, data: { turbo_method: :delete }) { "Sign-out" }
                  end
                end
              else
                Link(href: join_path, variant: :link) { "Join" }
              end

              render Components::AddPostBtn.new
            end
          end
        end
      end
    end
  end
end
