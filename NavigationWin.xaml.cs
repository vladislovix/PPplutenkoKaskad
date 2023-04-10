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
using System.Windows.Shapes;

namespace PPplutenkoKaskad
{
    /// <summary>
    /// Логика взаимодействия для NavigationWin.xaml
    /// </summary>
    public partial class NavigationWin : Window
    {
        public NavigationWin()
        {
            InitializeComponent();
        }

        private void btnWindow1_Click(object sender, RoutedEventArgs e)
        {
            frame.Navigate(new PostavControl1());
        }

        private void btnWindow2_Click(object sender, RoutedEventArgs e)
        {
            frame.Navigate(new ClientControl2());
        }

        private void btnWindow3_Click(object sender, RoutedEventArgs e)
        {
            frame.Navigate(new SotrudControl3());
        }

        private void btnWindow4_Click(object sender, RoutedEventArgs e)
        {
            frame.Navigate(new ZakazControl4());
        }

        private void btnWindow5_Click(object sender, RoutedEventArgs e)
        {
            frame.Navigate(new TovarControl5());
        }

        private void btnWindow6_Click(object sender, RoutedEventArgs e)
        {
            frame.Navigate(new ZakazTovarControl6());
        }
    }
}
