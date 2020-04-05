def create(self, cr, uid, values, context=None):
        
       #Check availability before creating.
      
        arrival_date, departure_date, = values['arrival_day'] + " 16:00:00", values['departure_day'] + " 10:00:00"
        if not self.check_availability(cr, uid, arrival_date, departure_date, context=context):
            raise osv.except_osv(_('Unavailable dates !'), _("Unable to book for the selected dates."))
        return osv.Model.create(self, cr, uid, values, context=context)

    def write(self, cr, uid, ids, values, context=None):
    
      #Check availability before writing.
    
        if type(ids) == list and len(ids) > 1 and ('arrival_date' in values or 'departure_date' in values):
            raise osv.except_osv(('Date Change denied !'), ("Changing departure or arrival dates for several bookings at the same time is not allowed."))
        elif type(ids) != list:
            ids = [ids]

        arrival_date, departure_date = None, None

        # Get the two dates 
        if 'arrival_day' in values and 'departure_day' not in values:
            read = self.read(cr, uid, ids[0], ['departure_date'], context=context)
            arrival_date, departure_date = values['arrival_day'] + " 16:00:00", read['departure_date']
        elif 'departure_day' in values and 'arrival_day' not in values:
            read = self.read(cr, uid, ids[0], ['arrival_date'], context=context)
            arrival_date, departure_date = read['arrival_date'], values['departure_day'] + " 10:00:00"

        if arrival_date is not None: 
            # Checking available periods. 
            if not self.check_availability(cr, uid, arrival_date, departure_date, current_id=ids[0], context=context):
                raise osv.except_osv(('Unavailable dates !'), ("Unable to book for the selected dates."))

        # self.message_post(cr, uid, ids, _('Booking <b>updated</b>'), context=context)

        return osv.Model.write(self, cr, uid, ids, values, context=context)

    def accept_booking(self, cr, uid, ids, context=None, *args):
        
        #Change state to 'approved'.
        
        if type(ids) != list:
            ids = [ids]
        read = self.read(cr, uid, ids, ['price'], context=context)
        if any(r['price'] <= 0 for r in read):
            raise osv.except_osv(_('Price not set !'), _("Booking price has to be set."))
        self.write(cr, uid, ids, {'state': 'approved'})
        self.message_post(cr, uid, ids, _('Booking <b>approved</b>'), context=context)
        
        self.send_email(cr, uid, ids, context=context)   
        return True
    
    
    def send_email(self, cr, uid, ids, context=None):
        
        template_id = self.pool.get('email.template').search(cr, uid, [('name', '=', 'House booking - Send by Email')], context=context)[0]
        email_obj = self.pool.get('email.template')
        email_obj.send_mail(cr, uid, template_id, ids[0], force_send=True)
    
    def refuse_booking(self, cr, uid, ids, context=None, *args):
    
        self.write(cr, uid, ids, {'state': 'denied'})
        self.message_post(cr, uid, ids, _('Booking <b>denied</b>'), context=context)
        return True

    def check_availability(self, cr, uid, arrival_date, departure_date, current_id=None, context=None):
        
        # sch : supprimé au 15 mai
        #if len(arrival_date) == 10:
        #    arrival_date += " 16:00:00"
        #if len(departure_date) == 10:
        #    departure_date += " 16:00:00"
        # Domain of bookings crossing targeted period.
        domaine = [
            ('state', '!=', 'denied'),
            '!',
            '|',
            ('arrival_date','>=',departure_date),
            ('departure_date','<=',arrival_date),
        ]
        
        sch = self.search(cr, uid, [], context=context)
        brw = self.browse(cr, uid, sch, context=context)

        # Remove current booking.
        if current_id is not None:
            domaine.insert(0, ('id', '!=', current_id))

        search = self.search(cr, uid, domaine, context=context)
        long = len(search)
        res = long == 0
        return res
