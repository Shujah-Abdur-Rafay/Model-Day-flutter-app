CREATE TABLE public.industry_contacts (id UUID DEFAULT gen_random_uuid() PRIMARY KEY, name TEXT NOT NULL, company TEXT, role TEXT, email TEXT, phone TEXT, notes TEXT, created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL, updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL); ALTER TABLE public.industry_contacts ENABLE ROW LEVEL SECURITY; CREATE POLICY \
Users
can
view
their
own
industry
contacts\ ON public.industry_contacts FOR SELECT USING (auth.uid() = auth.uid()); CREATE POLICY \Users
can
create
their
own
industry
contacts\ ON public.industry_contacts FOR INSERT WITH CHECK (auth.uid() = auth.uid()); CREATE POLICY \Users
can
update
their
own
industry
contacts\ ON public.industry_contacts FOR UPDATE USING (auth.uid() = auth.uid()); CREATE POLICY \Users
can
delete
their
own
industry
contacts\ ON public.industry_contacts FOR DELETE USING (auth.uid() = auth.uid()); CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.industry_contacts FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
