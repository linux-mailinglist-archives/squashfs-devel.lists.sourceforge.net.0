Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692052E344
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZl-0007NL-Cp; Fri, 20 May 2022 03:45:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nqoOd-0002mk-29
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 04:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ywUvyK+Dszp2X4vOivCGWZ6YlqiFabRmkG3CZZ0nWs=; b=WUimuRnsmvETOJ86pG6Bhsa0RL
 g67KMaUf26s2doT22AXFJF1o4Cfh8gYmFDxX/fzAiBebb9tQzQ5u1R2sWHGEY4krsc8VEl8F6KCW/
 hiowUN4oo2nBl8XtnfCebzR4c/kgfTF9INiK/V/DWueq9gottSc1X2x5VCDjoEkFvkx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ywUvyK+Dszp2X4vOivCGWZ6YlqiFabRmkG3CZZ0nWs=; b=McBYZDs6gjDXLV/Cp0ei41PVkK
 UXNXsEuNTSv0edf30CrJGZeRSyff3k3ZnB7xalhjPe+diuwQVve15ywEuSe9kecxKAK/+1aOsMAsC
 F9zYYog3Z+ucbOU57hCnhz3EF7BoBhMmqSLNqOkG4FrKD4MZL5pFoE+e2i8deO2WONE8=;
Received: from p3plsmtp06-04-2.prod.phx3.secureserver.net ([97.74.135.59]
 helo=p3plwbeout06-04.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqoOa-0002Ab-FV
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 04:01:17 +0000
Received: from mailex.mailcore.me ([94.136.40.143]) by :WBEOUT: with ESMTP
 id qo5gnZICvwdwPqo5hnjQPJ; Mon, 16 May 2022 20:41:45 -0700
X-CMAE-Analysis: v=2.4 cv=G5PZr/o5 c=1 sm=1 tr=0 ts=62831979
 a=EhJYbXVJKsomWlz4CTV+qA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=oZkIemNP1mAA:10 a=anyJmfQTAAAA:8
 a=NEAV23lmAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=i-5SCMXTAAAA:20
 a=qMDeoKeJ2IOt-7S2xNsA:9 a=QEXdDO2ut3YA:10 a=YJ_ntbLOlx1v6PCnmBeL:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: qo5gnZICvwdwP
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp12.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nqo5f-0006FM-HL; Tue, 17 May 2022 04:41:44 +0100
Message-ID: <c3175517-4177-d4d8-0aeb-9c21bc748149@squashfs.org.uk>
Date: Tue, 17 May 2022 04:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: kernel test robot <lkp@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
References: <20220516105100.1412740-3-hsinyi@chromium.org>
 <202205162301.zVca8ZpM-lkp@intel.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <202205162301.zVca8ZpM-lkp@intel.com>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfOpiU29BMZBn1OeD8Rldczr1w6w4M2/PTQ+yl6rjbkLUIefc90t05Rcu2/s0W3Qhmo6JFTnZSP6hbV7yNVYGOqa1o8QvVKQPPhTW8F4WcZaOQzFMbhud
 dFoyY7+UZoat346lFq5Gu6Bih7Vw9FbnoOMrQ3sgFBWJ/GtSFwjOMYscq361shmqVHfcJHGZ+BwEU7hSsBhGqCPpFbhTxDU2YRPaiqOtMVjFHXyBRLZwHlxq
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 16/05/2022 17:01, kernel test robot wrote: > Hi Hsin-Yi, 
 > > Thank you for the patch! Yet something to improve: > > [auto build test
 ERROR on next-20220513] > [cannot apply to akpm-mm/mm-everything [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [97.74.135.59 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [97.74.135.59 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nqoOa-0002Ab-FV
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:11 +0000
Subject: Re: [Squashfs-devel] [PATCH 2/2] squashfs: implement readahead
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, kbuild-all@lists.01.org,
 Zhang Yi <yi.zhang@huawei.com>, linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 16/05/2022 17:01, kernel test robot wrote:
> Hi Hsin-Yi,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on next-20220513]
> [cannot apply to akpm-mm/mm-everything v5.18-rc7 v5.18-rc6 v5.18-rc5 v5.18-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

This is fixed by

[PATCH 3/2] squashfs: always build "file direct" version of page actor

Which I have just sent.

Phillip

> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hsin-Yi-Wang/Implement-readahead-for-squashfs/20220516-185438
> base:    1e1b28b936aed946122b4e0991e7144fdbbfd77e
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220516/202205162301.zVca8ZpM-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/573e1f2ced0df097c30c595d5bf5a9e7a5fcb8d5
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Hsin-Yi-Wang/Implement-readahead-for-squashfs/20220516-185438
>          git checkout 573e1f2ced0df097c30c595d5bf5a9e7a5fcb8d5
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     fs/squashfs/file.c: In function 'squashfs_readahead':
>>> fs/squashfs/file.c:526:17: error: implicit declaration of function 'squashfs_page_actor_init_special'; did you mean 'squashfs_page_actor_init'? [-Werror=implicit-function-declaration]
>       526 |         actor = squashfs_page_actor_init_special(pages, max_pages, 0);
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                 squashfs_page_actor_init
>     fs/squashfs/file.c:526:15: warning: assignment to 'struct squashfs_page_actor *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       526 |         actor = squashfs_page_actor_init_special(pages, max_pages, 0);
>           |               ^
>     fs/squashfs/file.c: At top level:
>>> fs/squashfs/file.c:577:9: error: request for member 'readahead' in something not a structure or union
>       577 |         .readahead = squashfs_readahead
>           |         ^
>     cc1: some warnings being treated as errors
> 
> 
> vim +526 fs/squashfs/file.c
> 
>     498	
>     499	static void squashfs_readahead(struct readahead_control *ractl)
>     500	{
>     501		struct inode *inode = ractl->mapping->host;
>     502		struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
>     503		size_t mask = (1UL << msblk->block_log) - 1;
>     504		size_t shift = msblk->block_log - PAGE_SHIFT;
>     505		loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
>     506		loff_t start = readahead_pos(ractl) &~ mask;
>     507		size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
>     508		struct squashfs_page_actor *actor;
>     509		unsigned int nr_pages = 0;
>     510		struct page **pages;
>     511		u64 block = 0;
>     512		int bsize, res, i, index;
>     513		int file_end = i_size_read(inode) >> msblk->block_log;
>     514		unsigned int max_pages = 1UL << shift;
>     515	
>     516		readahead_expand(ractl, start, (len | mask) + 1);
>     517	
>     518		if (readahead_pos(ractl) + readahead_length(ractl) < req_end ||
>     519		    file_end == 0)
>     520			return;
>     521	
>     522		pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
>     523		if (!pages)
>     524			return;
>     525	
>   > 526		actor = squashfs_page_actor_init_special(pages, max_pages, 0);
>     527		if (!actor)
>     528			goto out;
>     529	
>     530		for (;;) {
>     531			nr_pages = __readahead_batch(ractl, pages, max_pages);
>     532			if (!nr_pages)
>     533				break;
>     534	
>     535			if (readahead_pos(ractl) >= i_size_read(inode) ||
>     536			    nr_pages < max_pages)
>     537				goto skip_pages;
>     538	
>     539			index = pages[0]->index >> shift;
>     540			if ((pages[nr_pages - 1]->index >> shift) != index)
>     541				goto skip_pages;
>     542	
>     543			bsize = read_blocklist(inode, index, &block);
>     544			if (bsize == 0)
>     545				goto skip_pages;
>     546	
>     547			res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
>     548						 actor);
>     549	
>     550			if (res >= 0)
>     551				for (i = 0; i < nr_pages; i++)
>     552					SetPageUptodate(pages[i]);
>     553	
>     554			for (i = 0; i < nr_pages; i++) {
>     555				unlock_page(pages[i]);
>     556				put_page(pages[i]);
>     557			}
>     558		}
>     559	
>     560		kfree(actor);
>     561		kfree(pages);
>     562		return;
>     563	
>     564	skip_pages:
>     565		for (i = 0; i < nr_pages; i++) {
>     566			unlock_page(pages[i]);
>     567			put_page(pages[i]);
>     568		}
>     569	
>     570		kfree(actor);
>     571	out:
>     572		kfree(pages);
>     573	}
>     574	
>     575	const struct address_space_operations squashfs_aops = {
>     576		.read_folio = squashfs_read_folio
>   > 577		.readahead = squashfs_readahead
> 



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
