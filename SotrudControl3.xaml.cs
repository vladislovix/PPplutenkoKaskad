using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PPplutenkoKaskad
{
    /// <summary>
    /// Логика взаимодействия для SotrudControl3.xaml
    /// </summary>
    public partial class SotrudControl3 : UserControl
    {
        diplomplEntities db;
        List<Сотрудники> tb;
        public SotrudControl3()
        {
            InitializeComponent();
            db = new diplomplEntities();
            tb = db.Сотрудники.ToList();
            SuppliersDataGrid.ItemsSource = tb;
        }
        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            var Search = db.Сотрудники.ToList();
            Search = Search.Where(x => x.Должность.ToLower().StartsWith(SearchTextBox.Text.ToLower())).ToList();
            SuppliersDataGrid.ItemsSource = Search.ToList();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            db = new diplomplEntities();
            Сотрудники item = SuppliersDataGrid.SelectedItem as Сотрудники;
            Сотрудники del = db.Сотрудники.Where(d => d.ID_сотрудника == item.ID_сотрудника).Single();
            db.Сотрудники.Remove(del);
            db.SaveChanges();
            MessageBox.Show("Строка успешно удалена!");
            refreshdatagrid();
        }

        private void refreshdatagrid()
        {
            SuppliersDataGrid.ItemsSource = db.Сотрудники.ToList();
            SuppliersDataGrid.Items.Refresh();
        }

        private void Add_button(object sender, RoutedEventArgs e)
        {
            var nw = new Сотрудники();
            db.Сотрудники.Add(nw);
            AddSotryd add = new AddSotryd(db, nw);
            add.ShowDialog();
            refreshdatagrid();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}

